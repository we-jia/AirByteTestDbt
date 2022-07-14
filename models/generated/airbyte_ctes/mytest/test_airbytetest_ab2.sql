{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_mytest",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('test_airbytetest_ab1') }}
select
    cast(id as {{ dbt_utils.type_float() }}) as id,
    cast(name as {{ dbt_utils.type_string() }}) as name,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_airbytetest_ab1') }}
-- test_airbytetest
where 1 = 1

