with
    cartao as (
        select *
        from{{ ref('stg_erp__cartaocredito') }}
    ) 


select *
from cartao