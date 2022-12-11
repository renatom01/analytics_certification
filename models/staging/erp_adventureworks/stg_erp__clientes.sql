with
    public_customer as (
        select
            cast(customerid as int) as id_cliente
            , cast(rowguid as string) as id_linha_cliente			
            , cast(lastname as string) as ultimo_nome_cliente
            , cast(firstname as string) as primeiro_nome_cliente				
            , cast(middlename as string) as meio_nome_cliente				
            --, cast(namestyle)				
            , cast(companyname as string) as nome_empresa_cliente				
            --, cast(passwordsalt)				
            --, cast(suffix)				
            --, cast(modifieddate)				
            --, cast(passwordhash)				
            --, cast(_sdc_table_version)				
            --, cast(salesperson)				
            --, cast(_sdc_received_at)				
            --, cast(_sdc_sequence)			
            --, cast(title)				
            --, cast(emailaddress)				
            --, cast(phone)								
            --, cast(_sdc_batched_at)				            
        from{{ source('erp', 'public_customer')}}
    )
select *
from public_customer