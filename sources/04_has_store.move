module objects::has_store;

#[allow(unused_field)]
public struct HasStore has store {
    test: u64
}

#[allow(unused_field)]
public struct HasKey has key {
    id: UID,
    has_store: HasStore,
}

public fun new_has_key(test: u64, ctx: &mut TxContext): HasKey {
    HasKey {
        id: object::new(ctx),
        has_store: HasStore { test },
    }
}

fun init(ctx: &mut TxContext) {
    let public_object = new_has_key(40, ctx);
    transfer::share_object(public_object);
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

#[test]
fun test_store_it() {
    let mut scenario = ts::begin(@0x0);

    let obj = HasStore {
        test: 20
    };
    assert_eq(obj.test, 20);

    let obj_key = HasKey {
        id: object::new(scenario.ctx()),
        has_store: obj
    };
    transfer::transfer(obj_key, @0x0);

    scenario.end();
}
