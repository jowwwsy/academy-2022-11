with
    transportadoras as (
        select *
        from {{ ref('stg_erp_shippers') }}
    )

    , transformed as (
        select
            row_number() over (order by id_transportadora) as sk_transportadora
            , id_transportadora
            , nome_transportadora
            , telefone_transportadora
        from transportadoras
    )

select *
from transformed