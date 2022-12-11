with
    public_salesorderheader as (
        select
            cast (salesorderid as int ) as id_pedido_venda
            , cast (customerid as int) as id_cliente
            , cast (billtoaddressid	as int) id_cobranca_endereco
            , cast (shiptoaddressid as int) id_envio_ende
            --, cast (creditcardid as int) as id_cartaocredito				
            , cast (purchaseordernumber as string) as numero_pedido_compra											
            --, cast (salesordernumber as string) as numero_pedido_venda			
            --, cast (modifieddate)				
            --, cast (rowguid				
            , cast (taxamt as numeric) as imposto_venda				
            , cast (shiptoaddressid as string) id_endereco_envio				
            --, cast (onlineorderflag)		
            --, cast (_sdc_table_version)				
            , cast (shipmethod as string) as metodo_envio				
            , cast (status as int) as status_pedido				
            , cast (orderdate as timestamp) as data_pedido				
            --, cast (_sdc_received_at)				
            --, cast (_sdc_sequence)				
            , cast (subtotal as numeric) as subtotal_pedido				
            , cast (revisionnumber as int) as numero_revisao_pedido				
            , cast (freight as string) as frete_pedido 			
            , cast (duedate as timestamp) as data_prrazo_pedido				
            , cast (totaldue as numeric) as total_pedido							
            , cast (shipdate as timestamp) as data_envio_pedido				
            --, cast (_sdc_batched_at)				
            --, cast (accountnumber)						            
        from{{ source('erp', 'public_salesorderheader')}}
    )
select *
from public_salesorderheader