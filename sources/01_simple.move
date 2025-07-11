module objects::must_drop;

public struct Simple {
    test: u64
}

use sui::test_scenario as ts;
use sui::test_utils::assert_eq;

const DEPLOYER: address = @0x0;

#[test]
fun test() {
    let scenario = ts::begin(DEPLOYER);

    let obj = Simple {
        test: 20
    };
    assert_eq(obj.test, 20);
    let Simple { test: _ } = obj;

    scenario.end();
}