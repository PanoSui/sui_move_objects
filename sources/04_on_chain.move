module objects::on_chain;

#[allow(unused_field)]
public struct OnChain has key, store {
    id: UID,
    test: u64
}

#[test_only]
use sui::test_scenario as ts;
#[test_only]
use sui::test_utils::assert_eq;

#[test]
fun test() {
    let mut scenario = ts::begin(@0x0);

    let obj = OnChain {
        id: object::new(scenario.ctx()),
        test: 20
    };
    assert_eq(obj.test, 20);

    transfer::transfer(obj, @0x0);

    scenario.end();
}

#[test]
fun test_public() {
    let mut scenario = ts::begin(@0x0);

    let obj = OnChain {
        id: object::new(scenario.ctx()),
        test: 20
    };
    assert_eq(obj.test, 20);

    transfer::public_share_object(obj);

    scenario.end();
}
