{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "mytest",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_airbytetest_ab3') }}
select
    id,
    name,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_test_airbytetest_hashid
from {{ ref('test_airbytetest_ab3') }}
-- test_airbytetest from {{ source('mytest', '_airbyte_raw_test_airbytetest') }}
where 1 = 1

