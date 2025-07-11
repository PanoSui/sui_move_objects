module objects::on_chain;

public struct OnChain has key, store {
    id: UID,
    test: u64
}

use sui::test_scenario as ts;
use sui::test_utils::assert_eq;

const DEPLOYER: address = @0x0;

#[test]
fun test() {
    let mut scenario = ts::begin(DEPLOYER);

    let obj = OnChain {
        id: object::new(scenario.ctx()),
        test: 20
    };
    assert_eq(obj.test, 20);

    transfer::transfer(obj, DEPLOYER);

    scenario.end();
}

#[test]
fun test_public() {
    let mut scenario = ts::begin(DEPLOYER);

    let obj = OnChain {
        id: object::new(scenario.ctx()),
        test: 20
    };
    assert_eq(obj.test, 20);

    transfer::public_share_object(obj);

    scenario.end();
}
