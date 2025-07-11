module objects::has_drop;

#[allow(unused_field)]
public struct HasDrop has drop {
    test: u64
}

#[test_only]
use sui::test_scenario as ts;
#[test_only]
use sui::test_utils::assert_eq;


#[test]
fun test() {
    let scenario = ts::begin(@0x0);

    let obj = HasDrop {
        test: 20
    };
    assert_eq(obj.test, 20);

    scenario.end();
}