(module $floats-3aaf96b80dc7af10.wasm
  (table $table0 1 1 funcref)
  (memory $memory (;0;) (export "memory") 16)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1048576))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1048576))
  (func $add_f32 (;0;) (export "add_f32") (param $var0 f32) (param $var1 f32) (result f32)
    local.get $var0
    local.get $var1
    f32.add
  )
  (func $add_f64 (;1;) (export "add_f64") (param $var0 f64) (param $var1 f64) (result f64)
    local.get $var0
    local.get $var1
    f64.add
  )
)