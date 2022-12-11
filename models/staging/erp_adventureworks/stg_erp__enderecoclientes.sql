with
    public_customeraddress as (
        select 
            cast(customerid as int) as id_cliente
            , cast(addressid as int) as id_endereco           	
            , cast(addresstype as string) as tipo_endereco				
            --, cast(modifieddate)				
            --, cast(rowguid)				
            --, cast(_sdc_table_version)				
            --, cast(_sdc_received_at)				
            --, cast(_sdc_sequence)								
            --, cast(_sdc_batched_at)								   				            
        from{{ source('erp', 'public_customeraddress')}}
    )
select *
from public_customeraddress