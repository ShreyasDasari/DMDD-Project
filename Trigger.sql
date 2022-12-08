-- When the customer places an order, the inventory of the product should be reduced by the corresponding qunantity.
create or replace trigger cust_order_trigger
after
    insert on orders
declare
    v_order_num number := 1;
begin
    update product
    set inventory = inventory - v_order_num;
end;




-- When the customer returns any products, the inventory of the product should increase.
create or replace trigger cust_return_trigger
after
    delete on orders
declare
    v_order_num number := 1;
begin
    update product
    set inventory = inventory + v_order_num;
end;





-- When the customer open the web, the viewdate of this web should be updated.
create or replace trigger browse_trigger
after
    insert on custpage
begin
    update webpage
    set viewdate = sysdate;
end;


