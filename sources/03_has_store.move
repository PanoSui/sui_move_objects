module objects::has_store;

public struct HasStore has store {
    test: u64
}

use sui::test_scenario as ts;
use sui::test_utils::assert_eq;

const DEPLOYER: address = @0x0;

#[test]
fun test() {
    let scenario = ts::begin(DEPLOYER);

    let obj = HasStore {
        test: 20
    };
    assert_eq(obj.test, 20);
    let HasStore { test: _ } = obj;

    scenario.end();
}
