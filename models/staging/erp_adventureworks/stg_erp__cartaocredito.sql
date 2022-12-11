with
    sales_creditcard as (
        select
            cast(creditcardid as int) as id_cartaocredito
            , cast(cardtype	as string) as tipo_cartao
            --, cast(cardnumber)			
            --, cast(expyear)				
            --, cast(modifieddate)
            --, cast(expmonth)				
            --, cast(_sdc_table_version)				
            --, cast(_sdc_received_at)				
            --, cast(_sdc_sequence)								
            --, cast(_sdc_batched, _at)									   				            
        from{{ source('erp', 'sales_creditcard')}}
    )
select *
from sales_creditcard