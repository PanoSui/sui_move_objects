module objects::has_drop;

public struct HasDrop has drop {
    test: u64
}

use sui::test_scenario as ts;
use sui::test_utils::assert_eq;

const DEPLOYER: address = @0x0;

#[test]
fun test() {
    let scenario = ts::begin(DEPLOYER);

    let obj = HasDrop {
        test: 20
    };
    assert_eq(obj.test, 20);

    scenario.end();
}