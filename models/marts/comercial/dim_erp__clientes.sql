with
    cliente as (
        select *
        from{{ ref('stg_erp__clientes') }}
    )

    , enderecoclientes as (
        select *
        from {{ ref('stg_erp__enderecoclientes') }}
    )

    , endereco as (
        select *
        from{{ref('stg_erp__enderecos')}}
    ) 

    , uniao_tabelas as (
        select
            cliente.id_cliente
            , cliente.id_linha_cliente
            , enderecoclientes.id_endereco           		
            , cliente.ultimo_nome_cliente
            , cliente.primeiro_nome_cliente				
            , cliente.meio_nome_cliente								
            , cliente.nome_empresa_cliente
            , enderecoclientes.tipo_endereco           	
            , endereco.cidade
            , endereco.cep
            , endereco.detalhe_endereco			
            , endereco.pais				
            , endereco.estado	
            

         
        from cliente
        left join enderecoclientes on cliente.id_cliente = enderecoclientes.id_cliente
        left join endereco on enderecoclientes.id_endereco = endereco.id_endereco
    )

    , transformacoes as (
        select
            row_number() over (order by id_cliente) as sk_cliente
            , *
        from uniao_tabelas    
    )

select *
from transformacoes