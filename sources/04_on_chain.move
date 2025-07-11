module objects::on_chain;

#[allow(unused_field)]
public struct OnChain has key, store {
    id: UID,
    test: u64
}

public fun new_obj(test: u64, ctx: &mut TxContext): OnChain {
    OnChain {
        id: object::new(ctx),
        test,
    }
}

fun init(ctx: &mut TxContext) {
    let private_obj = new_obj(20, ctx);
    transfer::transfer(private_obj, ctx.sender());

    let public_object = new_obj(40, ctx);
    transfer::public_share_object(public_object);
}

#[test_only]
use sui::test_scenario as ts;
#[test_only]
use sui::test_utils::assert_eq;

#[test]
fun test() {
    let mut scenario = ts::begin(@0x0);

    let obj = new_obj(20, scenario.ctx());
    assert_eq(obj.test, 20);

    transfer::transfer(obj, @0x0);

    scenario.end();
}

#[test]
fun test_public() {
    let mut scenario = ts::begin(@0x0);

    let obj = new_obj(20, scenario.ctx());
    assert_eq(obj.test, 20);

    transfer::public_share_object(obj);

    scenario.end();
}
