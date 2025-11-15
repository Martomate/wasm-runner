(module $log-9826d33c07873659.wasm
  (func $console_log (;0;) (import "env" "console_log") (param i32))
  (table $table0 1 1 funcref)
  (memory $memory (;0;) (export "memory") 17)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1048582))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1048592))
  (func $run (;1;) (export "run")
    i32.const 1048576
    call $console_log
  )
  (data (i32.const 1048576) "Hello\00")
)