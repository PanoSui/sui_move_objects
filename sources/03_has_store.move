module objects::has_store;

#[allow(unused_field)]
public struct HasStore has store {
    test: u64
}

#[test_only]
use sui::test_scenario as ts;
#[test_only]
use sui::test_utils::assert_eq;

#[test]
fun test() {
    let scenario = ts::begin(@0x0);

    let obj = HasStore {
        test: 20
    };
    assert_eq(obj.test, 20);
    let HasStore { .. } = obj;

    scenario.end();
}
