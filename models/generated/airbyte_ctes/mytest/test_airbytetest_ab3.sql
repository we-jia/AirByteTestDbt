{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_mytest",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test_airbytetest_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'id',
        'name',
    ]) }} as _airbyte_test_airbytetest_hashid,
    tmp.*
from {{ ref('test_airbytetest_ab2') }} tmp
-- test_airbytetest
where 1 = 1

