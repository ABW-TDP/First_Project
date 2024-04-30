<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\UnitController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\FloorController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\TableController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\DineInController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\DeliveryController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\MenuItemController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\TownshipController;
use App\Http\Controllers\UserRoleController;
use App\Http\Controllers\MemberCardController;
use App\Http\Controllers\StockIssueController;
use App\Http\Controllers\CustomerTypeController;
use App\Http\Controllers\ItemDiscountController;
use App\Http\Controllers\MenuCategoryController;
use App\Http\Controllers\StockReceiveController;
use App\Http\Controllers\MemberCardTypeController;
use App\Http\Controllers\StockIssueTypeController;
use App\Http\Controllers\EmployeePositionController;

Route::middleware(['auth:sanctum',config('jetstream.auth_session'),'verified'])->group(function () {

    //Dashboard
    Route::get('dashboardPage',[AuthController::class,'dashboardPage'])->name('auth#dashboardPage');

    Route::group(['prefix' => 'admin','middleware'=>'admin_auth'],function(){

        //Store -> Dine_in
        Route::get('dineInPage',[DineInController::class,'dineInPage'])->name('store#dineInPage');

        //Store -> Order
        Route::post('orderPage',[OrderController::class,'orderPage'])->name('store#orderPage');

        //Customer->customer/customer_type
        Route::get('customerPage',[CustomerController::class,'customerPage'])->name('customer#customerPage');
        Route::get('customerTypePage',[CustomerTypeController::class,'customerTypePage'])->name('customer#customerTypePage');

        //Stock Control->stock_receive->receive/receive_list
        Route::get('receivePage',[StockReceiveController::class,'receivePage'])->name('stockControl#stock_receive#receivePage');
        Route::get('receiveListPage',[StockReceiveController::class,'receiveListPage'])->name('stockControl#stock_receive#receiveListPage');

        //Stock Control->stock_issue->issue/issue_list
        Route::get('issuePage',[StockIssueController::class,'issuePage'])->name('stockControl#stock_issue#issuePage');
        Route::get('issueListPage',[StockIssueController::class,'issueListPage'])->name('stockControl#stock_issue#issueListPage');

        //Stock Control->Issue Type
        Route::get('issueTypePage',[StockIssueTypeController::class,'issueTypePage'])->name('stockControl#issue_type');

        //Stock Control->stock_purchase->purchase/purchase_list
        Route::get('purcahsePage',[PurchaseController::class,'purchasePage'])->name('stockControl#stock_purchase#purchasePage');
        Route::get('purcahseListPage',[PurchaseController::class,'purchaseListPage'])->name('stockControl#stock_purchase#purchaseListPage');
        Route::get('checkPurchaseDetailValidation', [PurchaseController::class, 'checkPurchaseDetailValidation']);
        Route::get('savePurchase',[PurchaseController::class,'savePurchase']);
        Route::get('updatePurchasePage/{id}',[PurchaseController::class,'updatePurchasePage'])->name('stockControl#stock_purchase#updatePurchasePage');
        Route::get('updateCheckPurchaseDetailValidation', [PurchaseController::class, 'updateCheckPurchaseDetailValidation'])->name('stockControl#stock_purchase#updateCheckPurchaseDetailValidation');
        Route::get('updatePurchase',[PurchaseController::class,'updatePurchase'])->name('stockControl#stock_purchase#updatePurchase');
        Route::post('deleteSelectedPurchase', [PurchaseController::class, 'deleteSelectedPurchase'])->name('stockControl#stock_purchase#purchaseListPage#deleteSelectedPurchase');
        Route::get('GetPaidLog',[PurchaseController::class,'GetPaidLog'])->name('stockControl#stock_purchase#purchaseListPage#GetPaidLog');
        Route::get('createPaymentLog', [PurchaseController::class, 'createPaymentLog'])->name('stockControl#stock_purchase#purchaseListPage#createPaymentLog');
        Route::get('GetPaidEditLog',[PurchaseController::class,'GetPaidEditLog'])->name('stockControl#stock_purchase#purchaseListPage#GetPaidEditLog');
        Route::get('editPaymentLog', [PurchaseController::class, 'editPaymentLog'])->name('stockControl#stock_purchase#purchaseListPage#editPaymentLog');
        Route::get('deletePaidLog', [PurchaseController::class, 'deletePaidLog'])->name('stockControl#stock_purchase#purchaseListPage#deletePaidLog');

        //Card->coupon_card
        Route::get('couponCardPage',[CouponController::class,'couponCardPage'])->name('card#couponCardPage');

        //Card->member_card->card/card_type
        Route::get('memberCardPage',[MemberCardController::class,'memberCardPage'])->name('card#memberCard#memberCardPage');
        Route::get('memberCardTypePage',[MemberCardTypeController::class,'memberCardTypePage'])->name('card#memberCard#memberCardTypePage');

        //User->employee->employee/employee_position
        Route::get('employeePage',[EmployeeController::class,'employeePage'])->name('user#employee#employeePage');
        Route::get('employeePositionPage',[EmployeePositionController::class,'employeePositionPage'])->name('user#employee#employeePositionPage');

        //User->users->user/user_role
        Route::get('userPage',[UserController::class,'userPage'])->name('user#users#userPage');
        Route::get('userRolePage',[UserRoleController::class,'userRolePage'])->name('user#users#userRolePage');

        //Supplier->supplier/supplier_list
        Route::get('supplierPage',[SupplierController::class,'supplierPage'])->name('supplier#supplierPage');
        Route::get('supplierListPage',[SupplierController::class,'supplierListPage'])->name('supplier#supplierListPage');

        //Config->item->category/item/unit/discount
        Route::get('categoryPage',[MenuCategoryController::class,'categoryPage'])->name('config#item#categoryPage');
        Route::get('itemPage',[MenuItemController::class,'itemPage'])->name('config#item#itemPage');
        Route::get('unitPage',[UnitController::class,'unitPage'])->name('config#item#unitPage');
        Route::get('discountPage',[ItemDiscountController::class,'discountPage'])->name('config#item#discountPage');

        //Config->floor/table/location/delivery
        Route::get('floorPage',[FloorController::class,'floorPage'])->name('config#floorPage');
        Route::get('tablePage',[TableController::class,'tablePage'])->name('config#tablePage');
        Route::get('locationPage',[LocationController::class,'locationPage'])->name('config#locationPage');
        Route::get('deliveryPage',[DeliveryController::class,'deliveryPage'])->name('config#deliveryPage');

        //Bar Category Create/ Update/ Delete
        Route::post('barCategory/create',[MenuCategoryController::class,'createBarCategory'])->name('barCategory#create');
        Route::post('barCategory/update',[MenuCategoryController::class,'updateBarCategory'])->name('barCategory#update');
        Route::post('barCategory/delete',[MenuCategoryController::class,'deleteBarCategory'])->name('barCategory#delete');

        //Kitchen Category Create/ Update/ Delete
        Route::post('kitchenCategory/create',[MenuCategoryController::class,'createKitchenCategory'])->name('kitchenCategory#create');
        Route::post('kitchenCategory/update',[MenuCategoryController::class,'updateKitchenCategory'])->name('kitchenCategory#update');
        Route::post('kitchenCategory/delete',[MenuCategoryController::class,'deleteKitchenCategory'])->name('kitchenCategory#delete');

        //Refrigerator Category Create/ Update/ Delete
        Route::post('refrigeratorCategory/create',[MenuCategoryController::class,'createRefrigeratorCategory'])->name('refrigeratorCategory#create');
        Route::post('refrigeratorCategory/update',[MenuCategoryController::class,'updateRefrigeratorCategory'])->name('refrigeratorCategory#update');
        Route::post('refrigeratorCategory/delete',[MenuCategoryController::class,'deleteRefrigeratorCategory'])->name('refrigeratorCategory#delete');

        //Service Category Create/ Update/ Delete
        Route::post('serviceCategory/create',[MenuCategoryController::class,'createServiceCategory'])->name('serviceCategory#create');
        Route::post('serviceCategory/update',[MenuCategoryController::class,'updateServiceCategory'])->name('serviceCategory#update');
        Route::post('serviceCategory/delete',[MenuCategoryController::class,'deleteServiceCategory'])->name('serviceCategory#delete');

        //Item->dropdown
        Route::get('item/item', [MenuItemController::class,'getSubCategoryByMainCategory']);

        //Item Create/ Update/ Delete
        Route::post('item/create',[MenuItemController::class,'createItem'])->name('item#create');
        Route::post('item/update',[MenuItemController::class,'updateItem'])->name('item#update');
        Route::post('item/delete',[MenuItemController::class,'deleteItem'])->name('item#delete');

        //Unit Create/ Update/ Delete
        Route::post('unit/create',[UnitController::class,'createUnit'])->name('unit#create');
        Route::post('unit/update',[UnitController::class,'updateUnit'])->name('unit#update');
        Route::post('unit/delete',[UnitController::class,'deleteUnit'])->name('unit#delete');

        //Discount/Get Dropdown data
        Route::get('item/getSubCategory', [ItemDiscountController::class,'getSubCategoryByMainCategory']);
        Route::get('item/getItem', [ItemDiscountController::class, 'getItemByMainCategoryAndSubCategory']);
        Route::get('item/getItemPrice', [ItemDiscountController::class, 'getItemPriceByItemID']);

        //Discount Create/ Update /Delete
        Route::post('discount/create',[ItemDiscountController::class,'createDiscount'])->name('discount#create');
        Route::get('discount/updatePage/{item_discount_id}',[ItemDiscountController::class,'discountUpdatePage'])->name('discount#updatePage');
        Route::post('discount/update',[ItemDiscountController::class,'updateDiscount'])->name('discount#update');
        Route::post('discount/delete',[ItemDiscountController::class,'deleteDiscount'])->name('discount#delete');

        //Floor Create/ Update/ Delete
        Route::post('floor/create',[FloorController::class,'createFloor'])->name('floor#create');
        Route::post('floor/update',[FloorController::class,'updateFloor'])->name('floor#update');
        Route::post('floor/delete',[FloorController::class,'deleteFloor'])->name('floor#delete');

        //Table Create/ Update/ Delete
        Route::post('table/create',[TableController::class,'createTable'])->name('table#create');
        Route::post('table/update',[TableController::class,'updateTable'])->name('table#update');
        Route::post('table/delete',[TableController::class,'deleteTable'])->name('table#delete');

        //City Create/ Update/ Delete
        Route::post('city/create',[CityController::class,'createCity'])->name('city#create');
        Route::post('city/update',[CityController::class,'updateCity'])->name('city#update');
        Route::post('city/delete',[CityController::class,'deleteCity'])->name('city#delete');

        //Township Create/ Update/ Delete
        Route::post('township/create',[TownshipController::class,'createTownship'])->name('township#create');
        Route::post('township/update',[TownshipController::class,'updateTownship'])->name('township#update');
        Route::post('township/delete',[TownshipController::class,'deleteTownship'])->name('township#delete');

        //City->dropdown
        Route::get('city/getTownship', [DeliveryController::class,'getTownshipByCity']);

        //Delivery Create/ Update/ Delete
        Route::post('delivery/create',[DeliveryController::class,'createDelivery'])->name('delivery#create');
        Route::post('delivery/update',[DeliveryController::class,'updateDelivery'])->name('delivery#update');
        Route::post('delivery/delete',[DeliveryController::class,'deleteDelivery'])->name('delivery#delete');

        //Customer Create/ Update/ Delete
        Route::post('customer/create',[CustomerController::class,'createCutomer'])->name('customer#create');
        Route::get('customer/updatePage/{customer_id}',[CustomerController::class,'customerUpdatePage'])->name('customer#updatePage');
        Route::post('customer/update',[CustomerController::class,'updateCutomer'])->name('customer#update');
        Route::post('customer/delete',[CustomerController::class,'deleteCutomer'])->name('customer#delete');

        //Customer Type Create/ Update/ Delete
        Route::post('customerType/create',[CustomerTypeController::class,'createCutomerType'])->name('customerType#create');
        Route::post('customerType/update',[CustomerTypeController::class,'updateCutomerType'])->name('customerType#update');
        Route::post('customerType/delete',[CustomerTypeController::class,'deleteCutomerType'])->name('customerType#delete');

        //Coupon Card Create/ Update/ Delete
        Route::post('couponCard/create',[CouponController::class,'createCouponCard'])->name('couponCard#create');
        Route::post('couponCard/update',[CouponController::class,'updateCouponCard'])->name('couponCard#update');
        Route::post('couponCard/delete',[CouponController::class,'deleteCouponCard'])->name('couponCard#delete');

        //MemberCard Type->dropdown
        Route::get('memberCardType/memberCardType', [MemberCardController::class,'getMemberCardTypeByMemberCardTypeID']);

        //Member Card Create/ Update/ Delete
        Route::post('memberCard/create',[MemberCardController::class,'createMemberCard'])->name('memberCard#create');
        Route::post('memberCard/update',[MemberCardController::class,'updateMemberCard'])->name('memberCard#update');
        Route::post('memberCard/delete',[MemberCardController::class,'deleteMemberCard'])->name('memberCard#delete');

        //Member Card Type Create/ Update/ Delete
        Route::post('memberCardType/create',[MemberCardTypeController::class,'createMemberCardType'])->name('memberCardType#create');
        Route::post('memberCardType/update',[MemberCardTypeController::class,'updateMemberCardType'])->name('memberCardType#update');
        Route::post('memberCardType/delete',[MemberCardTypeController::class,'deleteMemberCardType'])->name('memberCardType#delete');


        //Employees Create/ Update/ Delete
        Route::post('employee/create',[EmployeeController::class,'createEmployee'])->name('employee#create');
        Route::post('employee/update',[EmployeeController::class,'updateEmployee'])->name('employee#update');
        Route::post('employee/delete',[EmployeeController::class,'deleteEmployee'])->name('employee#delete');

        //Employees Position Create/ Update/ Delete
        Route::post('employeePosition/create',[EmployeePositionController::class,'createEmployeePosition'])->name('employeePosition#create');
        Route::post('employeePosition/update',[EmployeePositionController::class,'updateEmployeePosition'])->name('employeePosition#update');
        Route::post('employeePosition/delete',[EmployeePositionController::class,'deleteEmployeePosition'])->name('employeePosition#delete');

        //User Create/ Update/ Delete
        Route::get('user/getEmployeeCode', [UserController::class, 'getEmpoyeeCodeByEmployeeID']);
        Route::post('user/create',[UserController::class,'createUser'])->name('user#create');
        Route::post('user/update',[UserController::class,'updateUser'])->name('user#update');
        Route::post('user/delete',[UserController::class,'deleteUser'])->name('user#delete');

        //User Role Create/ Update/ Delete
        Route::post('userRole/create',[UserRoleController::class,'createUserRole'])->name('userRole#create');
        Route::post('userRole/update',[UserRoleController::class,'updateUserRole'])->name('userRole#update');
        Route::post('userRole/delete',[UserRoleController::class,'deleteUserRole'])->name('userRole#delete');

        //Supplier Create/ Update/ Delete
        Route::post('supplier/create',[SupplierController::class,'createSupplier'])->name('supplier#create');
        Route::post('supplier/update',[SupplierController::class,'updateSupplier'])->name('supplier#update');
        Route::post('supplier/delete',[SupplierController::class,'deleteSupplier'])->name('supplier#delete');

        Route::post('table/merge',[DineInController::class,'tableMerge'])->name('table#merge');

        Route::get('floor/getTable', [DineInController::class, 'getTableByFloorID']);
        Route::get('floor/getTableOnly', [DineInController::class, 'getTableByFloorIDOnly']);
        Route::get('table/getOrder', [DineInController::class, 'getOrderByTableIDAndOrderNumber']);

        Route::get('mainCategory/getSubCategory', [OrderController::class, 'getSubCategoryByMainCategory']);
        Route::get('subCategory/getItem', [OrderController::class, 'getItemBySubCategory']);
        Route::get('mainCategory/getItem', [OrderController::class, 'getItemByMainCategory']);
        Route::get('order/addOrderItem', [OrderController::class, 'addOrderItem']);
        Route::get('searchKey/getItem', [OrderController::class, 'getItemBySearchKey']);



    });

});

//Login
Route::redirect('/', 'loginPage');
Route::get('loginPage',[AuthController::class,'loginPage'])->name('auth#loginPage');

