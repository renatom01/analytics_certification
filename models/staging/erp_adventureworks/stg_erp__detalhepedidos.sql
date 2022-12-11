with
    public_salesorderdetail as (
        select
            cast(salesorderid as int) as id_pedido_venda	
            , cast(salesorderdetailid as int) id_pedido_detalhe_venda
            , cast(productid as int) as id_produto
            , cast(orderqty as int) as quantidade_pedido										
            , cast(unitprice as numeric) as preco_unitario				
            --, cast(modifieddate)				
            --, cast(rowguid)				
            --, cast(linetotal)				
            --, cast(_sdc_table_version)							
            --, cast(_sdc_received_at)				
            --, cast(_sdc_sequence)				
            --, cast(_sdc_batched_at)				
            , cast(unitpricediscount as numeric) as desconto_preco_unitario		
					            
        from{{ source('erp', 'public_salesorderdetail')}}
    )
select *
from public_salesorderdetail