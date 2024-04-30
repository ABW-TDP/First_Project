<?php

namespace App\Http\Controllers;

use App\Models\MenuItem;
use App\Models\Purchase;
use App\Models\Supplier;
use Illuminate\Http\Request;
use App\Models\PurchaseDetail;
use App\Models\PurchasePaymentLog;
use App\Models\SupplierLedger;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class PurchaseController extends Controller
{
    //direct purchase page
    public function purchasePage(){
        $itemList = MenuItem::query()->where(['menu_items.is_discontinued' => 0,'menu_items.is_deleted' => 0])
        ->whereIn('I.item_type_id',[1,3])
        ->select('menu_items.*', 'U.unit_name')
        ->join('units as U', 'U.unit_id', '=', 'menu_items.unit_id')
        ->join('item_types as I', 'I.item_type_id', '=', 'menu_items.item_type_id')
        ->get();
        $supplierList = Supplier::query()->where('is_discontinued','0')->where('is_deleted','0')->get();
        // Purchase::where('active', 1)->max('price');
        // $voucher_count = ['year' => date('y'),'count' => Purchase::whereYear('purchase_date', date('Y'))->count()+1];
        $voucherNo = "P-".date('y')."-".Purchase::whereYear('purchase_date', date('Y'))->count()+1;
        return view('admin.stock_control.stock_purchase.purchase',compact('itemList','supplierList','voucherNo'));
    }

    //direct purchase list page
    public function purchaseListPage(){
        // $purchaseList = Purchase::query()->where(['purchases.is_cancel' => null])
        // ->select('purchases.*', 'S.supplier_name')
        // ->selectRaw("SUM(paid_amount) as paid_amount")
        // ->join('suppliers as S', 'S.supplier_id', '=', 'purchases.supplier_id')
        // ->join('supplier_ledgers as L', 'L.purchase_id', '=', 'purchases.purchase_id')
        // ->groupBy(['purcahse_id', 'purchase_date', 'discount_date', 'purchase_voucher_number', 'supplier_id', 'store_id', 'currency_id', 'exchange_rate', 'total_amount', 'transport_charges', 'tax', 'other_charges', 'total_discount', 'remark', 'is_cancel', 'cancel_by', 'cancel_date', 'cancel_reason', 'location_id', 'is_updated', 'modified_by', 'created_at', 'updated_at','supplier_name'])
        // ->get();

        $purchaseList = Purchase::query()->where(['purchases.is_delete' => null])
        ->select('purchases.*', 'S.supplier_name')
        ->selectRaw('IFNULL(SUM(PL.voucher_discount),0)+purchases.total_item_discount as discount_amount')
        ->selectRaw('IFNULL(SUM(PL.transport_charges), 0) as transport_charges')
        ->selectRaw('IFNULL(SUM(PL.other_charges), 0) as other_charges')
        ->selectRaw('IFNULL(SUM(PL.tax), 0) as tax')
        ->selectRaw('IFNULL(SUM(PL.paid_amount), 0) as paid_amount') // ->selectRaw('COALESCE(SUM(PL.paid_amount), 0) as paid_amount')
        ->join('suppliers as S', 'S.supplier_id', '=', 'purchases.supplier_id')
        ->leftJoin('purchase_payment_logs as PL', 'PL.purchase_id', '=', 'purchases.purchase_id')
        ->groupBy(['purchase_id', 'purchase_voucher_number', 'supplier_id', 'purchase_date', 'due_date', 'remark', 'total_amount', 'total_item_discount', 'is_delete', 'delete_reason', 'is_updated', 'modified_by', 'created_at', 'updated_at','supplier_name'])
        ->get();
        return view('admin.stock_control.stock_purchase.purchase_list',compact('purchaseList'));
    }

    public function updatePurchasePage($purchaseID){
        $itemList = MenuItem::query()->where(['menu_items.is_discontinued' => 0,'menu_items.is_deleted' => 0]) // ->orwhere('menu_items.is_discontinued','0')->where('menu_items.is_deleted','0')
                    ->whereIn('I.item_type_id',[1,3])
                    ->select('menu_items.*', 'U.unit_name')
                    ->join('units as U', 'U.unit_id', '=', 'menu_items.unit_id')
                    ->join('item_types as I', 'I.item_type_id', '=', 'menu_items.item_type_id')
                    ->get();
        $supplierList = Supplier::query()->where('is_discontinued','0')->where('is_deleted','0')->get();

        $selectedPurchase = Purchase::query()->where(['is_delete' => null,'purchase_id' => $purchaseID])->get();
                            // ->select('purchases.*')
                            // ->selectRaw("SUM(paid_amount) as paid_amount")
                            // ->join('supplier_ledgers as L', 'L.purchase_id', '=', 'purchases.purcahse_id')
                            // ->groupBy(['purcahse_id', 'purchase_date', 'discount_date', 'purchase_voucher_number', 'supplier_id', 'store_id', 'currency_id', 'exchange_rate', 'total_amount', 'transport_charges', 'tax', 'other_charges', 'total_discount', 'remark', 'is_cancel', 'cancel_by', 'cancel_date', 'cancel_reason', 'location_id', 'is_updated', 'modified_by', 'created_at', 'updated_at'])
                            // ->get();

        $selectedPurchaseDetailList = PurchaseDetail::query()->where(['purchase_id' => $purchaseID])
                                        ->select('purchase_details.item_id as itemID','I.item_name','I.item_code','I.bar_code as barcode','purchase_details.unit_id','U.unit_name','purchase_details.quantity as qty','purchase_details.unit_cost','purchase_details.inventory_cost','purchase_details.discount_amount as discount','purchase_details.is_foc as foc','purchase_details.expire_date')
                                        ->selectRaw('purchase_details.quantity*purchase_details.unit_cost as amount')
                                        ->selectRaw('purchase_details.quantity*purchase_details.unit_cost-purchase_details.discount_amount as net_amount')
                                        ->join('menu_items as I', 'I.item_id', '=', 'purchase_details.item_id')
                                        ->join('units as U', 'U.unit_id', '=', 'purchase_details.unit_id')
                                        ->get();
        // $paidList = SupplierLedger::query()->where(['purchase_id' =>$purchaseID])->where('paid_amount','>',0)
        //                     ->select('supplier_ledger_id','payment_date', 'paid_amount')
        //                     ->get();
        return view('admin.stock_control.stock_purchase.update_purchase',compact('itemList','supplierList','selectedPurchase','selectedPurchaseDetailList'));
        // return redirect()->route('stockControl#stock_purchase#updatePurchasePage',compact('itemList','supplierList','selectedPurchase','selectedPurchaseDetailList'))->with( [ 'id' => $purchaseID] );
    }

    public function checkPurchaseDetailValidation(Request $request){

        $validator = Validator::make($request->all(), [
                'itemID' => 'gt:0',
                'qty' => 'required|numeric',
                'unit_cost' => 'required|numeric',
                'inventory_cost' => 'numeric',
                'discount' => 'numeric'
            ],[
                'itemID.gt' => 'You need to select item name!',
                'qty.required' => 'You need to enter quantity',
                'unit_cost.required' => 'You need to enter unit cost',
                'qty.numeric' => "Number Only!",
                'unit_cost.numeric' => "Number Only!",
                'inventory_cost.numeric' => "Number Only!",
                'discount.numeric' => "Number Only!"
            ]);
        // return response()->json(['errors' => $validator]);
        // $param = $request->query('item_name');
        if ($validator->passes()) {
            return response()->json(['success'=>'Added successful']);
        }
        else{
            return response()->json(['errors' => $validator->getMessageBag()->toArray()]);
            // return response()->json(['errors'=>$validator->errors()->all()]);
        }
    }

    public function updateCheckPurchaseDetailValidation(Request $request){
        $validator = Validator::make($request->all(), [
                'itemID' => 'gt:0',
                'qty' => 'required|numeric',
                'unit_cost' => 'required|numeric',
                'inventory_cost' => 'numeric',
                'discount' => 'numeric'
            ],[
                'itemID.gt' => 'You need to select item name!',
                'qty.required' => 'You need to enter quantity',
                'unit_cost.required' => 'You need to enter unit cost',
                'qty.numeric' => "Number Only!",
                'unit_cost.numeric' => "Number Only!",
                'inventory_cost.numeric' => "Number Only!",
                'discount.numeric' => "Number Only!"
            ]);
        if ($validator->passes()) {
            return response()->json(['success'=>'Added successful']);
        }
        else{
            return response()->json(['errors' => $validator->getMessageBag()->toArray()]);
        }
    }

    public function savePurchase(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'supplier_name' => 'gt:0',
             // 'purchase_detaillist' => 'required|array|min:1'
        ],[
            'supplier_name.gt' => 'You need to select supplier name!',
            // 'purchase_detaillist' =>'You need to set item detail!'
        ]);
        if ($validator->passes()) {
        try {
                DB::beginTransaction();
                $purchase_detaillist = $request->purchase_detailList;
                $voucherNo = "P-".date('y')."-".Purchase::whereYear('purchase_date', date('Y'))->count()+1;
                $data = $this->addPurchaseMasterData($request,$voucherNo);
                $result = Purchase::create($data);
                foreach ($purchase_detaillist as $detail) {
                    $detail_data = $this->addPurchaseDetailData($detail,$result->id);
                    PurchaseDetail::create($detail_data);
                }
                //// $supplierLedger = $this->addSupplierLedger($request,$result->id);
                //// SupplierLedger::create($supplierLedger);
                DB::commit();
                // return response()->json(['success'=>$purchase_detaillist]);
                return response()->json(['success'=>"Save Successful!"]);
            } catch (\Exception $e) {
                DB::rollBack();
                return response()->json(['errors' => $e->getMessage()]);
            }
        }else{
            return response()->json(['errors' => $validator->getMessageBag()->toArray()]);
        }
    }

    public function updatePurchase(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'supplier_name' => 'gt:0',
             // 'purchase_detaillist' => 'required|array|min:1'
        ],[
            'supplier_name.gt' => 'You need to select supplier name!',
            // 'purchase_detaillist' =>'You need to set item detail!'
        ]);
        if ($validator->passes()) {
        try {
                DB::beginTransaction();
                $purchase_detaillist = $request->purchase_detailList;
                $data = $this->addPurchaseMasterData($request,$request->voucher_no);
                $data['is_updated'] = true;
                Purchase::where('purchase_id',$request->purchaseID)->update($data);

                PurchaseDetail::where('purchase_id',  $request->purchaseID)->delete(); //Delete old detail by purchaseID
                foreach ($purchase_detaillist as $detail) {
                    $detail_data = $this->addPurchaseDetailData($detail,$request->purchaseID);
                    $detail_data['is_updated'] = true;
                    PurchaseDetail::create($detail_data);
                }

                // $total = PurchasePaymentLog::where('purchase_id','=',$request->purchaseID)->pluck('total_amount');
                $total = PurchasePaymentLog::where('purchase_id','=',$request->purchaseID)->select('total_amount')->skip(0)->take(1)->get();
                if(count($total) > 0){
                    if ($total[0]->total_amount > $request->totalAmount) {
                        $sub_amount = $total[0]->total_amount - $request->totalAmount;
                        $sub_net = $total[0]->total_amount - ($request->totalAmount - $request->totalDiscount);
                        PurchasePaymentLog::where('purchase_payment_log_id', $total[0]->purchase_payment_log_id)->update([
                            'total_amount' =>  DB::raw('total_amount - ' . $sub_amount),
                            'net_amount' =>  DB::raw('net_amount - ' . $sub_net),
                            'balance' => DB::raw('balance - ' . $sub_amount),
                        ]);
                        PurchasePaymentLog::where('purchase_id', $request->purchaseID)->skip(1)->update([
                            'total_amount' =>  DB::raw('total_amount - ' . $sub_amount),
                            'net_amount' =>  DB::raw('net_amount - ' . $sub_amount),
                            'balance' => DB::raw('balance - ' . $sub_amount),
                        ]);
                    }else if($total[0]->total_amount < $request->totalAmount){
                        $add_amount = $request->totalAmount - $total[0]->total_amount;
                        $add_net = ($request->totalAmount -  $request->totalDiscount) - $total[0]->total_amount;
                        PurchasePaymentLog::where('purchase_payment_log_id', $total[0]->purchase_payment_log_id)
                            ->update([
                            'total_amount' =>  DB::raw('total_amount + ' . $add_amount),
                            'net_amount' =>  DB::raw('net_amount + ' . $add_net),
                            'balance' => DB::raw('balance + ' . $add_amount),
                        ]);
                        PurchasePaymentLog::where('purchase_id', $request->purchaseID)->skip(1)
                        ->update([
                        'total_amount' =>  DB::raw('total_amount + ' . $add_amount),
                        'net_amount' =>  DB::raw('net_amount + ' . $add_amount),
                        'balance' => DB::raw('balance + ' . $add_amount),
                    ]);
                    }
                }
                DB::commit();
                // return response()->json(['success'=>$tot]);
                return response()->json(['success'=>"Update Successful!"]);
            } catch (\Exception $e) {
                DB::rollBack();
                return response()->json(['errors' => $e->getMessage()]);
            }
        }else{
            return response()->json(['errors' => $validator->getMessageBag()->toArray()]);
        }
    }

    private function addPurchaseMasterData($request,$voucherNo){
        $data = [
            'purchase_voucher_number' => $voucherNo,
            'supplier_id' => $request->supplier_name,
            'purchase_date' => $request->purchase_date,
            'due_date' => $request->due_date,
            'remark' => $request->remark,
            'total_amount' => $request->totalAmount,
            'total_item_discount' => $request->totalDiscount,
            'is_delete' => null,
            'delete_reason' => null,
            'is_updated' => false,
            'modified_by' =>  $request->loginUserID
        ];
        return $data;
    }

    private function addPurchaseDetailData($detail,$purchaseID){
        $data = [
            'purchase_id'=>$purchaseID,
            'item_id'=>$detail['itemID'],
            'unit_id'=>$detail['unit_id'],
            'batch_number'=>0,
            'quantity'=>$detail['qty'],
            'unit_cost'=>$detail['unit_cost'],
            'inventory_cost'=> isset($detail['inventory_cost'])?$detail['inventory_cost']:0,
            'discount_amount'=>isset($detail['discount'])?$detail['discount']:0,
            'expire_date'=>$detail['expire_date'],
            // 'is_foc'=>  $detail['foc'] == 'true' ? true : false,
            'is_foc'=> filter_var($detail['foc'], FILTER_VALIDATE_BOOLEAN),
            'is_updated'=>false,
            'is_deleted'=>null
        ];
        return $data;
    }

    public function deleteSelectedPurchase(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cancel_reason' => 'required'
        ],[
            'cancel_reason' => 'You need to text cancel reason!'
        ]);
        if ($validator->passes()) {
        try {
                DB::beginTransaction();
                $purchaseID = $request->purchase_deleteID;

                Purchase::where('purchase_id', $purchaseID)->update([
                    'is_delete' => 1,
                    'delete_reason' => $request->cancel_reason,
                    'modified_by' => $request->loginUserID,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);

                PurchaseDetail::where('purchase_id', $purchaseID)->update([
                    'is_deleted' => 1,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);

                DB::commit();
                return response()->json(['success' => "Delete Successful!"]);
            } catch (\Exception $e) {
                DB::rollBack();
                return response()->json(['errors' => $e->getMessage()]);
            }
        }else{
            return response()->json(['errors' => $validator->getMessageBag()->toArray()]);
        }
    }

    public function GetPaidLog(Request $request){
    try{
        $total = PurchasePaymentLog::where('purchase_id','=',$request->purchaseID)->skip(0)->take(1)->get();
        if(count($total) == 0){
            $total = Purchase::where('purchase_id',$request->purchaseID)
                    ->select('purchases.*', 'S.supplier_name')
                    ->selectRaw('total_amount-total_item_discount as balance')
                    ->join('suppliers as S', 'S.supplier_id', '=', 'purchases.supplier_id')->get();
        }else{
            $total = PurchasePaymentLog::where('purchase_payment_logs.purchase_id','=',$request->purchaseID)
                    ->select('purchase_payment_logs.*','P.purchase_voucher_number','P.due_date', 'S.supplier_name')//'P.total_item_discount' IFNULL
                    ->selectRaw('0 as total_item_discount')
                    ->join('purchases as P', 'P.purchase_id', '=', 'purchase_payment_logs.purchase_id')
                    ->join('suppliers as S', 'S.supplier_id', '=', 'P.supplier_id')
                    ->orderByDesc('purchase_payment_log_id')->skip(0)->take(1)->get();
        }
            return response()->json(['success'=>$total]);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e->getMessage()]);
        }
    }

    public function createPaymentLog(Request $request){
        // $this->validationCheckPaymentLog($request);
        // $data = $this->addPaymentLog($request);
        // PurchasePaymentLog::create($data);
        // return redirect()->back();


        $validator = Validator::make($request->all(), [
            'pay_amount' => 'required|numeric|gt:0',
            'voucher_discount'=> 'numeric',
            'tax' => 'numeric',
            'transport_charges' => 'numeric',
            'other_charges' => 'numeric'
        ],[
            'pay_amount.required' => 'You need to enter paid amount!',
            'pay_amount.numeric' =>  'Number Only!',
            'pay_amount.gt' => 'You need to enter paid amount',
            'voucher_discount' =>  'Number Only!',
            'tax' =>  'Number Only!',
            'transport_charges' => 'Number Only!',
            'other_charges' =>  'Number Only!',
        ]);
        if ($validator->passes()) {
            try{
                $data = $this->addPaymentLog($request);
                PurchasePaymentLog::create($data);
                return response()->json(['success'=>"Save successful!"]);
            } catch (\Exception $e) {
                return response()->json(['errors' => $e->getMessage()]);
            }
        }else{
            return response()->json(['errors' => $validator->getMessageBag()->toArray()]);
        }

    }

    private function validationCheckPaymentLog(Request $request){
        $validationRules=[
            'pay_amount' => 'required|numeric|gt:0',
            'voucher_discount'=> 'numeric',
            'tax' => 'numeric',
            'transport_charges' => 'numeric',
            'other_charges' => 'numeric'
        ];

        $validationMessages=[
            'pay_amount.required' => 'You need to enter paid amount!',
            'pay_amount.numeric' =>  'Number Only!',
            'pay_amount.gt' => 'You need to enter paid amount',
            'voucher_discount' =>  'Number Only!',
            'tax' =>  'Number Only!',
            'transport_charges' => 'Number Only!',
            'other_charges' =>  'Number Only!',
        ];

        $validator = Validator::make($request->all(), $validationRules, $validationMessages)->validate();
        return $validator;
    }

    private function addPaymentLog(Request $request)
    {
       $data =[
                'purchase_id' => $request->purchaseID,
                'paid_date' => $request->pay_date,
                'voucher_discount'=> $request->voucher_discount,
                'total_amount'=> $request->opening_total,
                'tax'=> $request->tax,
                'transport_charges'=> $request->transport_charges,
                'other_charges'=> $request->other_charges,
                'paid_amount'=> $request->pay_amount,
                'net_amount'=> $request->net_amount,
                'balance' => $request->balance
       ];
        return $data;
    }

    private function addPaymentLogForEdit(Request $request)
    {
       $data =[
                'paid_date' => $request->pay_date,
                'voucher_discount'=> $request->voucher_discount,
                'total_amount'=> $request->opening_total,
                'tax'=> $request->tax,
                'transport_charges'=> $request->transport_charges,
                'other_charges'=> $request->other_charges,
                'paid_amount'=> $request->pay_amount,
                'net_amount'=> $request->net_amount,
                'balance' => $request->balance
       ];
        return $data;
    }

    public function GetPaidEditLog(Request $request){
        try{
                $paid_edit_log= PurchasePaymentLog::where('purchase_payment_logs.purchase_id','=',$request->purchaseID)
                        ->select('purchase_payment_logs.*','P.purchase_voucher_number','P.due_date', 'S.supplier_name') //'P.total_item_discount'
                        ->selectRaw('0 as total_item_discount')
                        ->join('purchases as P', 'P.purchase_id', '=', 'purchase_payment_logs.purchase_id')
                        ->join('suppliers as S', 'S.supplier_id', '=', 'P.supplier_id')
                        ->orderByDesc('purchase_payment_log_id')->skip(0)->take(1)->get();
                return response()->json(['success'=>$paid_edit_log]);
            } catch (\Exception $e) {
                return response()->json(['errors' => $e->getMessage()]);
            }
    }

    public function editPaymentLog(Request $request){
        $validator = Validator::make($request->all(), [
            'pay_amount' => 'required|numeric|gt:0',
            'voucher_discount'=> 'numeric',
            'tax' => 'numeric',
            'transport_charges' => 'numeric',
            'other_charges' => 'numeric'
        ],[
            'pay_amount.required' => 'You need to enter paid amount!',
            'pay_amount.numeric' =>  'Number Only!',
            'pay_amount.gt' => 'You need to enter paid amount',
            'voucher_discount' =>  'Number Only!',
            'tax' =>  'Number Only!',
            'transport_charges' => 'Number Only!',
            'other_charges' =>  'Number Only!',
        ]);
        if ($validator->passes()) {
            try{
                $data = $this->addPaymentLogForEdit($request);
                PurchasePaymentLog::where('purchase_payment_log_id', $request->purchase_payment_log_id)->update($data);
                return response()->json(['success'=>"Edit successful!"]);
            } catch (\Exception $e) {
                return response()->json(['errors' => $e->getMessage()]);
            }
        }else{
            return response()->json(['errors' => $validator->getMessageBag()->toArray()]);
        }

    }

    public function deletePaidLog(Request $request){
        PurchasePaymentLog::where('purchase_payment_log_id', $request->purchase_payment_log_id)->delete();
        return response()->json(['success'=>"Delete successful!"]);
    }

    #Purchase
    // 'purchase_id'=>$purchaseID,
    // 'item_id'=>$detail['itemID'],
    // 'unit_id'=>$detail['unit_id'],
    // 'batch_number'=>0,
    // 'quantity'=>$detail['qty'],
    // 'unit_cost'=>$detail['unit_cost'],
    // 'discount_amount'=>isset($detail['discount'])?$detail['discount']:0,
    // 'inventory_cost'=> isset($detail['inventory_cost'])?$detail['inventory_cost']:0,
    // 'expire_date'=>$detail['expire_date'],
    // 'is_foc'=>$detail['foc'],
    // // 'is_foc'=>0,
    // 'item_remark'=> null,
    // 'location_id'=>1,
    // 'is_updated'=>false,
    // 'is_deleted'=>null

    #Purchase Detail
    // 'purchase_date' => $request->purchase_date,
    // 'discount_date' => $request->due_date,
    // 'purchase_voucher_number' => $voucherNo,
    // 'supplier_id' => $request->supplier_name,
    // 'store_id' => 1,
    // 'currency_id' => 1,
    // 'exchange_rate' => 0,
    // 'total_amount' => $request->totalAmount,
    // 'transport_charges' => isset($request->transportCharges)?$request->transportCharges:0,
    // 'tax' => isset($request->tax)?$request ->tax:0,
    // 'other_charges' => isset($request->otherCharges)?$request->otherCharges:0,
    // 'total_discount' => $request->totalDiscount,
    // 'remark' => isset($request->remark)?$request->remark:"P",
    // 'is_cancel' => null,
    // 'cancel_by' => null,
    // 'cancel_date' => null,
    // 'cancel_reason' => '',
    // 'location_id' => 1,
    // 'is_updated' => 1,
    // 'modified_by' => 1

    // private function addSupplierLedger($request, $purchaseID){
    //     $data = [
    //         'payment_date' =>$request->purchase_date,
    //         'supplier_id' => $request->supplier_name,
    //         'purchase_id' =>$purchaseID,
    //         'purchase_return_id' =>null,
    //         'outstanding_batch_number' =>1,
    //         'currency_id' =>1,
    //         'exchange_rate' =>1,
    //         'total_amount' =>$request->totalAmount,
    //         'transport_charges' => isset($request->transportCharges)?$request->transportCharges:0,
    //         'tax' => isset($request->tax)?$request ->tax:0,
    //         'other_charges' => isset($request->otherCharges)?$request->otherCharges:0,
    //         'total_discount' =>isset($request->totalDiscount)?$request->totalDiscount:0,
    //         'paid_amount' =>isset($request->payment)?$request->payment:0,
    //         'return_amount' =>0,
    //         'transaction_type' =>'P',
    //         'remark' =>isset($request->remark)?$request->remark:null,
    //         'location_id' =>1,
    //         'is_updated' =>1,
    //         'is_deleted'=>null,
    //         'modified_by' =>1
    //     ];
    //     return $data;
    // }


    // $totalAmt = SupplierLedger::where(['purchase_id' => $request->purchaseID])->where('total_amount','>',0)->first()->total_amount;
    // // if($totalAmt <>  $request->totalAmount){
    // SupplierLedger::where(['purchase_id' => $request->purchaseID])->where('total_amount','>',0)->update([
    //     'total_amount' => $request->totalAmount,
    //     'transport_charges' => isset($request->transportCharges)?$request->transportCharges:0,
    //     'tax' => isset($request->tax)?$request ->tax:0,
    //     'other_charges' => isset($request->otherCharges)?$request->otherCharges:0,
    //     'total_discount' => $request->totalDiscount,
    //     'paid_amount' => isset($request->paid_amount)?$request->paid_amount:0,
    // ]);
    // // }

    // if(isset($request->payment) && $request->payment > 0){
    //     $supplierLedger = $this->addSupplierLedger($request,$request->purchaseID);
    //     $supplierLedger['total_amount'] = 0;
    //     $supplierLedger['transport_charges'] = 0;
    //     $supplierLedger['tax'] = 0;
    //     $supplierLedger['other_charges'] = 0;
    //     $supplierLedger['total_discount'] = 0;
    //     SupplierLedger::create($supplierLedger);
    // }

}
