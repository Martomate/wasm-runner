(module $add-1ccbdf40c7165e13.wasm
  (table $table0 1 1 funcref)
  (memory $memory (;0;) (export "memory") 16)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1048576))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1048576))
  (func $add (;0;) (export "add") (param $var0 i32) (param $var1 i32) (result i32)
    local.get $var1
    local.get $var0
    i32.add
  )
)