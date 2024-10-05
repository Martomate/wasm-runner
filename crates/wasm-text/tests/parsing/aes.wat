(module $aes-ea8fb7bb572fc063.wasm
  (table $table0 9 9 funcref)
  (memory $memory (;0;) (export "memory") 17)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1051157))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1051168))
  (elem $elem0 (i32.const 1) (ref func) (ref.func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h9634f975d7713204E) (ref.func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd46d69ca3fa9eb1eE) (ref.func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd1c3de5eced27c6E) (ref.func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h9f0c1cb30e5cfa6fE) (ref.func $_ZN4core5panic12PanicPayload6as_str17h59025c0ecbb0f54eE) (ref.func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17h35704e8c93457832E) (ref.func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca6fb0e1cb4c7861E) (ref.func $_ZN4core3ops8function6FnOnce9call_once17hdddb86c5a6ab6037E))
  (func $new_array (;0;) (export "new_array") (param $var0 i32) (result i32)
    (local $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    block $label0
      i32.const 0
      i32.load8_u offset=1050684
      i32.const 3
      i32.eq
      br_if $label0
      local.get $var1
      i32.const 1050668
      i32.store offset=12
      local.get $var1
      i32.const 12
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17hf229ab053a1eb25aE
    end $label0
    local.get $var1
    i32.const 4
    i32.add
    call $_ZN3std4sync5mutex14Mutex$LT$T$GT$4lock17h1f3208a235323bdbE
    local.get $var1
    i32.load offset=8
    local.tee $var2
    i32.const 4
    i32.add
    local.get $var0
    call $_ZN8programs3aes5Arena8allocate17h9dfa44881955881aE
    local.set $var0
    local.get $var2
    i32.const 0
    i32.store8
    local.get $var1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get $var0
  )
  (func $_ZN3std3sys4sync4once10no_threads4Once4call17hf229ab053a1eb25aE (;1;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    block $label2
      block $label4
        block $label1
          block $label3
            block $label0
              i32.const 0
              i32.load8_u offset=1050684
              br_table $label0 $label1 $label2 $label3 $label0
            end $label0
            i32.const 0
            i32.const 2
            i32.store8 offset=1050684
            local.get $var0
            i32.load
            local.set $var2
            local.get $var0
            i32.const 0
            i32.store
            local.get $var2
            i32.eqz
            br_if $label4
            local.get $var1
            i32.const 8
            i32.add
            local.get $var2
            i32.load
            call_indirect (param i32)
            local.get $var2
            i32.const 8
            i32.add
            local.get $var1
            i32.const 8
            i32.add
            i32.const 8
            i32.add
            i64.load align=4
            i64.store align=4
            local.get $var2
            local.get $var1
            i64.load offset=8 align=4
            i64.store align=4
            i32.const 0
            i32.const 3
            i32.store8 offset=1050684
          end $label3
          local.get $var1
          i32.const 32
          i32.add
          global.set $__stack_pointer
          return
        end $label1
        local.get $var1
        i32.const 0
        i32.store offset=24
        local.get $var1
        i32.const 1
        i32.store offset=12
        local.get $var1
        i32.const 1049252
        i32.store offset=8
        local.get $var1
        i64.const 4
        i64.store offset=16 align=4
        local.get $var1
        i32.const 8
        i32.add
        i32.const 1049652
        call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
        unreachable
      end $label4
      call $_ZN4core6option13unwrap_failed17h9aa82eb71128b127E
      unreachable
    end $label2
    local.get $var1
    i32.const 0
    i32.store offset=24
    local.get $var1
    i32.const 1
    i32.store offset=12
    local.get $var1
    i32.const 1049316
    i32.store offset=8
    local.get $var1
    i64.const 4
    i64.store offset=16 align=4
    local.get $var1
    i32.const 8
    i32.add
    i32.const 1049652
    call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
    unreachable
  )
  (func $_ZN3std4sync5mutex14Mutex$LT$T$GT$4lock17h1f3208a235323bdbE (;2;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    i32.const 0
    i32.load8_u offset=1050668
    local.set $var2
    i32.const 0
    i32.const 1
    i32.store8 offset=1050668
    local.get $var1
    local.get $var2
    i32.store8 offset=7
    block $label0
      local.get $var2
      i32.eqz
      br_if $label0
      local.get $var1
      i64.const 0
      i64.store offset=20 align=4
      local.get $var1
      i64.const 17179869185
      i64.store offset=12 align=4
      local.get $var1
      i32.const 1049448
      i32.store offset=8
      local.get $var1
      i32.const 7
      i32.add
      local.get $var1
      i32.const 8
      i32.add
      call $_ZN4core9panicking13assert_failed17h8cbd36d22f47c107E
      unreachable
    end $label0
    local.get $var0
    i32.const 0
    i32.store
    local.get $var0
    i32.const 1050668
    i32.store offset=4
    local.get $var1
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN8programs3aes5Arena8allocate17h9dfa44881955881aE (;3;) (param $var0 i32) (param $var1 i32) (result i32)
    (local $var2 i32)
    (local $var3 i32)
    block $label1
      block $label0
        local.get $var1
        br_if $label0
        i32.const 0
        local.set $var1
        i32.const 1
        local.set $var2
        br $label1
      end $label0
      i32.const 0
      local.set $var2
      block $label3
        block $label2
          local.get $var1
          i32.const 0
          i32.lt_s
          br_if $label2
          i32.const 0
          i32.load8_u offset=1050688
          drop
          local.get $var1
          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17ha99e3efb2d98b193E
          local.tee $var2
          br_if $label3
          i32.const 1
          local.set $var2
        end $label2
        local.get $var2
        local.get $var1
        call $_ZN5alloc7raw_vec12handle_error17h76131d670f53a5eeE
        unreachable
      end $label3
      local.get $var2
      i32.const 0
      local.get $var1
      call $memset
      drop
    end $label1
    block $label4
      local.get $var0
      i32.load offset=8
      local.tee $var3
      local.get $var0
      i32.load
      i32.ne
      br_if $label4
      local.get $var0
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h2bd763bd9d30075bE
    end $label4
    local.get $var0
    local.get $var3
    i32.const 1
    i32.add
    i32.store offset=8
    local.get $var0
    i32.load offset=4
    local.get $var3
    i32.const 3
    i32.shl
    i32.add
    local.tee $var0
    local.get $var1
    i32.store offset=4
    local.get $var0
    local.get $var2
    i32.store
    local.get $var2
  )
  (func $drop_array (;4;) (export "drop_array") (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    block $label0
      i32.const 0
      i32.load8_u offset=1050684
      i32.const 3
      i32.eq
      br_if $label0
      local.get $var1
      i32.const 1050668
      i32.store offset=12
      local.get $var1
      i32.const 12
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17hf229ab053a1eb25aE
    end $label0
    local.get $var1
    i32.const 4
    i32.add
    call $_ZN3std4sync5mutex14Mutex$LT$T$GT$4lock17h1f3208a235323bdbE
    block $label2
      block $label1
        local.get $var1
        i32.load offset=8
        local.tee $var2
        i32.load offset=12
        local.tee $var3
        i32.eqz
        br_if $label1
        local.get $var3
        i32.const 3
        i32.shl
        local.set $var4
        i32.const 0
        local.set $var5
        local.get $var2
        i32.load offset=8
        local.tee $var6
        local.set $var7
        loop $label3
          local.get $var7
          i32.load
          local.get $var0
          i32.eq
          br_if $label2
          local.get $var5
          i32.const 1
          i32.add
          local.set $var5
          local.get $var7
          i32.const 8
          i32.add
          local.set $var7
          local.get $var4
          i32.const -8
          i32.add
          local.tee $var4
          br_if $label3
        end $label3
      end $label1
      i32.const 1049804
      i32.const 30
      i32.const 1049836
      call $_ZN4core6option13expect_failed17hacfbd4e0f8d6ca3bE
      unreachable
    end $label2
    local.get $var2
    local.get $var3
    i32.const -1
    i32.add
    local.tee $var4
    i32.store offset=12
    local.get $var6
    local.get $var5
    i32.const 3
    i32.shl
    i32.add
    local.tee $var7
    i32.load offset=4
    local.set $var5
    local.get $var7
    i32.load
    local.set $var0
    local.get $var7
    local.get $var6
    local.get $var4
    i32.const 3
    i32.shl
    i32.add
    i64.load align=4
    i64.store align=4
    block $label4
      local.get $var5
      i32.eqz
      br_if $label4
      local.get $var0
      local.get $var5
      call $__rust_dealloc
    end $label4
    local.get $var2
    i32.const 0
    i32.store8
    local.get $var1
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN4core6option13expect_failed17hacfbd4e0f8d6ca3bE (;5;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    local.get $var1
    i32.store offset=12
    local.get $var3
    local.get $var0
    i32.store offset=8
    local.get $var3
    i32.const 1
    i32.store offset=20
    local.get $var3
    i32.const 1048652
    i32.store offset=16
    local.get $var3
    i64.const 1
    i64.store offset=28 align=4
    local.get $var3
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $var3
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $var3
    local.get $var3
    i32.const 40
    i32.add
    i32.store offset=24
    local.get $var3
    i32.const 16
    i32.add
    local.get $var2
    call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
    unreachable
  )
  (func $__rust_dealloc (;6;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    block $label2
      block $label0
        local.get $var0
        i32.const -4
        i32.add
        i32.load
        local.tee $var2
        i32.const -8
        i32.and
        local.tee $var3
        i32.const 4
        i32.const 8
        local.get $var2
        i32.const 3
        i32.and
        local.tee $var2
        select
        local.get $var1
        i32.add
        i32.lt_u
        br_if $label0
        block $label1
          local.get $var2
          i32.eqz
          br_if $label1
          local.get $var3
          local.get $var1
          i32.const 39
          i32.add
          i32.gt_u
          br_if $label2
        end $label1
        local.get $var0
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17h00ce677e36b4e209E
        return
      end $label0
      i32.const 1050541
      i32.const 46
      i32.const 1050588
      call $_ZN4core9panicking5panic17hcaca2598a27ec0fcE
      unreachable
    end $label2
    i32.const 1050604
    i32.const 46
    i32.const 1050652
    call $_ZN4core9panicking5panic17hcaca2598a27ec0fcE
    unreachable
  )
  (func $encrypt_128 (;7;) (export "encrypt_128") (param $var0 i32) (param $var1 i32) (result i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    (local $var14 i32)
    (local $var15 i32)
    (local $var16 i32)
    (local $var17 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    block $label0
      i32.const 0
      i32.load8_u offset=1050684
      i32.const 3
      i32.eq
      br_if $label0
      local.get $var2
      i32.const 1050668
      i32.store offset=80
      local.get $var2
      i32.const 80
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17hf229ab053a1eb25aE
    end $label0
    local.get $var2
    i32.const 80
    i32.add
    call $_ZN3std4sync5mutex14Mutex$LT$T$GT$4lock17h1f3208a235323bdbE
    block $label2
      block $label1
        local.get $var2
        i32.load offset=84
        local.tee $var3
        i32.load offset=12
        local.tee $var4
        i32.eqz
        br_if $label1
        local.get $var3
        i32.const 4
        i32.add
        local.set $var5
        local.get $var4
        i32.const 3
        i32.shl
        local.set $var6
        i32.const 0
        local.set $var7
        local.get $var3
        i32.load offset=8
        local.tee $var8
        local.set $var9
        loop $label3
          local.get $var9
          i32.load
          local.get $var0
          i32.eq
          br_if $label2
          local.get $var7
          i32.const 1
          i32.add
          local.set $var7
          local.get $var9
          i32.const 8
          i32.add
          local.set $var9
          local.get $var6
          i32.const -8
          i32.add
          local.tee $var6
          br_if $label3
        end $label3
      end $label1
      i32.const 1049756
      i32.const 32
      i32.const 1049788
      call $_ZN4core6option13expect_failed17hacfbd4e0f8d6ca3bE
      unreachable
    end $label2
    block $label22
      block $label13
        block $label17
          block $label8
            block $label7
              block $label4
                local.get $var8
                local.get $var7
                i32.const 3
                i32.shl
                i32.add
                local.tee $var9
                i32.load offset=4
                local.tee $var7
                i32.const 16
                i32.ne
                br_if $label4
                local.get $var2
                i32.const 8
                i32.add
                local.get $var9
                i32.load
                local.tee $var9
                i32.const 8
                i32.add
                i64.load align=1
                i64.store
                local.get $var2
                local.get $var9
                i64.load align=1
                i64.store
                local.get $var4
                i32.const 3
                i32.shl
                local.set $var6
                i32.const 0
                local.set $var7
                local.get $var8
                local.set $var9
                block $label5
                  loop $label6
                    local.get $var9
                    i32.load
                    local.get $var1
                    i32.eq
                    br_if $label5
                    local.get $var7
                    i32.const 1
                    i32.add
                    local.set $var7
                    local.get $var9
                    i32.const 8
                    i32.add
                    local.set $var9
                    local.get $var6
                    i32.const -8
                    i32.add
                    local.tee $var6
                    br_if $label6
                  end $label6
                  i32.const 1049756
                  i32.const 32
                  i32.const 1049788
                  call $_ZN4core6option13expect_failed17hacfbd4e0f8d6ca3bE
                  unreachable
                end $label5
                local.get $var8
                local.get $var7
                i32.const 3
                i32.shl
                i32.add
                local.tee $var9
                i32.load offset=4
                local.tee $var7
                i32.const 16
                i32.ne
                br_if $label7
                local.get $var2
                i32.const 16
                i32.add
                i32.const 8
                i32.add
                local.get $var9
                i32.load
                local.tee $var9
                i32.const 8
                i32.add
                i64.load align=1
                i64.store
                local.get $var2
                local.get $var9
                i64.load align=1
                i64.store offset=16
                local.get $var2
                i32.const 32
                i32.add
                local.get $var2
                i32.const 16
                i32.add
                call $_ZN8programs3aes6cipher3Aes16with_128_bit_key17h065b4bafe4cba77cE
                local.get $var2
                i32.const 64
                i32.add
                i32.const 8
                i32.add
                local.get $var2
                i32.const 8
                i32.add
                i64.load
                i64.store
                local.get $var2
                local.get $var2
                i64.load
                i64.store offset=64
                local.get $var2
                i32.load offset=40
                local.tee $var10
                i32.eqz
                br_if $label8
                local.get $var2
                i32.const 80
                i32.add
                i32.const 8
                i32.add
                local.get $var2
                i32.load offset=36
                local.tee $var11
                i32.const 8
                i32.add
                i64.load align=1
                i64.store
                local.get $var2
                local.get $var11
                i64.load align=1
                i64.store offset=80
                i32.const 0
                local.set $var9
                loop $label9
                  local.get $var2
                  i32.const 64
                  i32.add
                  local.get $var9
                  i32.add
                  local.tee $var7
                  local.get $var7
                  i32.load8_u
                  local.get $var2
                  i32.const 80
                  i32.add
                  local.get $var9
                  i32.add
                  i32.load8_u
                  i32.xor
                  i32.store8
                  local.get $var9
                  i32.const 1
                  i32.add
                  local.tee $var9
                  i32.const 16
                  i32.ne
                  br_if $label9
                end $label9
                block $label10
                  local.get $var2
                  i32.load offset=44
                  local.tee $var12
                  i32.const 2
                  i32.lt_u
                  br_if $label10
                  i32.const 1
                  local.set $var13
                  loop $label15
                    i32.const 0
                    local.set $var9
                    loop $label11
                      local.get $var2
                      i32.const 64
                      i32.add
                      local.get $var9
                      i32.add
                      local.tee $var7
                      local.get $var7
                      i32.load8_u
                      i32.const 1049852
                      i32.add
                      i32.load8_u
                      i32.store8
                      local.get $var9
                      i32.const 1
                      i32.add
                      local.tee $var9
                      i32.const 16
                      i32.ne
                      br_if $label11
                    end $label11
                    local.get $var2
                    i32.const 64
                    i32.add
                    call $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$7forward17hfd5db0927aa771b8E
                    i32.const 0
                    local.set $var8
                    loop $label12
                      local.get $var2
                      i32.const 64
                      i32.add
                      local.get $var8
                      i32.add
                      local.tee $var9
                      i32.const 3
                      i32.add
                      local.tee $var6
                      local.get $var9
                      i32.const 1
                      i32.add
                      local.tee $var4
                      i32.load8_s
                      local.tee $var0
                      local.get $var9
                      i32.load8_s
                      local.tee $var1
                      i32.xor
                      local.tee $var14
                      local.get $var9
                      i32.const 2
                      i32.add
                      local.tee $var15
                      i32.load8_s
                      local.tee $var7
                      i32.xor
                      local.get $var1
                      i32.const 7
                      i32.shr_u
                      i32.const 27
                      i32.and
                      local.get $var1
                      i32.const 1
                      i32.shl
                      i32.xor
                      local.tee $var16
                      i32.xor
                      local.get $var6
                      i32.load8_s
                      local.tee $var6
                      i32.const 7
                      i32.shr_u
                      i32.const 27
                      i32.and
                      local.get $var6
                      i32.const 1
                      i32.shl
                      i32.xor
                      local.tee $var17
                      i32.xor
                      i32.store8
                      local.get $var15
                      local.get $var14
                      local.get $var6
                      i32.xor
                      local.get $var7
                      i32.const 7
                      i32.shr_u
                      i32.const 27
                      i32.and
                      local.get $var7
                      i32.const 1
                      i32.shl
                      i32.xor
                      local.tee $var14
                      i32.xor
                      local.get $var17
                      i32.xor
                      i32.store8
                      local.get $var4
                      local.get $var6
                      local.get $var7
                      local.get $var1
                      i32.xor
                      i32.xor
                      local.get $var0
                      i32.const 7
                      i32.shr_u
                      i32.const 27
                      i32.and
                      local.get $var0
                      i32.const 1
                      i32.shl
                      i32.xor
                      local.tee $var1
                      i32.xor
                      local.get $var14
                      i32.xor
                      i32.store8
                      local.get $var9
                      local.get $var6
                      local.get $var7
                      local.get $var0
                      i32.xor
                      local.get $var16
                      i32.xor
                      i32.xor
                      local.get $var1
                      i32.xor
                      i32.store8
                      local.get $var8
                      i32.const 4
                      i32.add
                      local.tee $var8
                      i32.const 16
                      i32.ne
                      br_if $label12
                    end $label12
                    local.get $var13
                    local.get $var10
                    i32.eq
                    br_if $label13
                    local.get $var13
                    i32.const 1
                    i32.add
                    local.set $var6
                    local.get $var2
                    i32.const 80
                    i32.add
                    i32.const 8
                    i32.add
                    local.get $var11
                    local.get $var13
                    i32.const 4
                    i32.shl
                    i32.add
                    local.tee $var9
                    i32.const 8
                    i32.add
                    i64.load align=1
                    i64.store
                    local.get $var2
                    local.get $var9
                    i64.load align=1
                    i64.store offset=80
                    i32.const 0
                    local.set $var9
                    loop $label14
                      local.get $var2
                      i32.const 64
                      i32.add
                      local.get $var9
                      i32.add
                      local.tee $var7
                      local.get $var7
                      i32.load8_u
                      local.get $var2
                      i32.const 80
                      i32.add
                      local.get $var9
                      i32.add
                      i32.load8_u
                      i32.xor
                      i32.store8
                      local.get $var9
                      i32.const 1
                      i32.add
                      local.tee $var9
                      i32.const 16
                      i32.ne
                      br_if $label14
                    end $label14
                    local.get $var6
                    local.set $var13
                    local.get $var6
                    local.get $var12
                    i32.ne
                    br_if $label15
                  end $label15
                end $label10
                i32.const 0
                local.set $var9
                loop $label16
                  local.get $var2
                  i32.const 64
                  i32.add
                  local.get $var9
                  i32.add
                  local.tee $var7
                  local.get $var7
                  i32.load8_u
                  i32.const 1049852
                  i32.add
                  i32.load8_u
                  i32.store8
                  local.get $var9
                  i32.const 1
                  i32.add
                  local.tee $var9
                  i32.const 16
                  i32.ne
                  br_if $label16
                end $label16
                local.get $var2
                i32.const 64
                i32.add
                call $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$7forward17hfd5db0927aa771b8E
                local.get $var10
                local.get $var12
                i32.le_u
                br_if $label17
                local.get $var2
                i32.const 80
                i32.add
                i32.const 8
                i32.add
                local.get $var11
                local.get $var12
                i32.const 4
                i32.shl
                i32.add
                local.tee $var9
                i32.const 8
                i32.add
                i64.load align=1
                i64.store
                local.get $var2
                local.get $var9
                i64.load align=1
                i64.store offset=80
                i32.const 0
                local.set $var9
                loop $label18
                  local.get $var2
                  i32.const 64
                  i32.add
                  local.get $var9
                  i32.add
                  local.tee $var7
                  local.get $var7
                  i32.load8_u
                  local.get $var2
                  i32.const 80
                  i32.add
                  local.get $var9
                  i32.add
                  i32.load8_u
                  i32.xor
                  i32.store8
                  local.get $var9
                  i32.const 1
                  i32.add
                  local.tee $var9
                  i32.const 16
                  i32.ne
                  br_if $label18
                end $label18
                local.get $var2
                i32.const 48
                i32.add
                i32.const 8
                i32.add
                local.get $var2
                i32.const 64
                i32.add
                i32.const 8
                i32.add
                i64.load
                i64.store
                local.get $var2
                local.get $var2
                i64.load offset=64
                i64.store offset=48
                local.get $var5
                i32.const 16
                call $_ZN8programs3aes5Arena8allocate17h9dfa44881955881aE
                local.set $var0
                block $label20
                  block $label19
                    local.get $var3
                    i32.load offset=12
                    local.tee $var9
                    i32.eqz
                    br_if $label19
                    local.get $var9
                    i32.const 3
                    i32.shl
                    local.set $var6
                    i32.const 0
                    local.set $var7
                    local.get $var3
                    i32.load offset=8
                    local.tee $var1
                    local.set $var9
                    loop $label21
                      local.get $var9
                      i32.load
                      local.get $var0
                      i32.eq
                      br_if $label20
                      local.get $var7
                      i32.const 1
                      i32.add
                      local.set $var7
                      local.get $var9
                      i32.const 8
                      i32.add
                      local.set $var9
                      local.get $var6
                      i32.const -8
                      i32.add
                      local.tee $var6
                      br_if $label21
                    end $label21
                  end $label19
                  i32.const 1049756
                  i32.const 32
                  i32.const 1049788
                  call $_ZN4core6option13expect_failed17hacfbd4e0f8d6ca3bE
                  unreachable
                end $label20
                local.get $var1
                local.get $var7
                i32.const 3
                i32.shl
                i32.add
                local.tee $var9
                i32.load offset=4
                local.tee $var7
                i32.const 16
                i32.ne
                br_if $label22
                local.get $var9
                i32.load
                local.tee $var9
                local.get $var2
                i64.load offset=48
                i64.store align=1
                local.get $var9
                i32.const 8
                i32.add
                local.get $var2
                i32.const 48
                i32.add
                i32.const 8
                i32.add
                i64.load
                i64.store align=1
                block $label23
                  local.get $var2
                  i32.load offset=32
                  local.tee $var9
                  i32.eqz
                  br_if $label23
                  local.get $var11
                  local.get $var9
                  i32.const 4
                  i32.shl
                  call $__rust_dealloc
                end $label23
                local.get $var3
                i32.const 0
                i32.store8
                local.get $var2
                i32.const 96
                i32.add
                global.set $__stack_pointer
                local.get $var0
                return
              end $label4
              i32.const 16
              local.get $var7
              i32.const 1049740
              call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h1f4168c6dfc810e9E
              unreachable
            end $label7
            i32.const 16
            local.get $var7
            i32.const 1049740
            call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h1f4168c6dfc810e9E
            unreachable
          end $label8
          i32.const 0
          i32.const 0
          i32.const 1050420
          call $_ZN4core9panicking18panic_bounds_check17hc47765e3d10a3709E
          unreachable
        end $label17
        local.get $var12
        local.get $var10
        i32.const 1050436
        call $_ZN4core9panicking18panic_bounds_check17hc47765e3d10a3709E
        unreachable
      end $label13
      local.get $var10
      local.get $var10
      i32.const 1050452
      call $_ZN4core9panicking18panic_bounds_check17hc47765e3d10a3709E
      unreachable
    end $label22
    local.get $var7
    i32.const 16
    i32.const 1049708
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h1f4168c6dfc810e9E
    unreachable
  )
  (func $_ZN8programs3aes6cipher3Aes16with_128_bit_key17h065b4bafe4cba77cE (;8;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    global.get $__stack_pointer
    i32.const 640
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    local.get $var2
    i32.const 560
    i32.add
    i32.const 0
    i32.const 44
    call $memset
    drop
    i32.const -11
    local.set $var3
    local.get $var2
    i32.const 560
    i32.add
    local.set $var4
    loop $label0
      local.get $var4
      local.get $var3
      i32.const 1050375
      i32.add
      i32.load8_u
      i32.store align=1
      local.get $var4
      i32.const 4
      i32.add
      local.set $var4
      local.get $var3
      i32.const 1
      i32.add
      local.tee $var3
      br_if $label0
    end $label0
    local.get $var2
    i32.const 4
    i32.add
    i32.const 1049852
    i32.const 512
    call $memcpy
    drop
    local.get $var2
    i32.const 4
    i32.add
    i32.const 512
    i32.add
    local.get $var2
    i32.const 560
    i32.add
    i32.const 44
    call $memcpy
    local.set $var5
    i32.const 0
    local.set $var3
    i32.const 0
    i32.load8_u offset=1050688
    drop
    block $label1
      i32.const 16
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17ha99e3efb2d98b193E
      local.tee $var6
      i32.eqz
      br_if $label1
      loop $label2
        local.get $var6
        local.get $var3
        i32.add
        local.get $var1
        local.get $var3
        i32.add
        i32.load align=1
        i32.store align=1
        local.get $var3
        i32.const 4
        i32.add
        local.tee $var3
        i32.const 16
        i32.ne
        br_if $label2
      end $label2
      local.get $var2
      i32.const 608
      i32.add
      i32.const 8
      i32.add
      local.get $var6
      i32.const 8
      i32.add
      i64.load align=1
      i64.store
      local.get $var2
      local.get $var6
      i64.load align=1
      i64.store offset=608
      i32.const 0
      local.set $var4
      i32.const 0
      i32.load8_u offset=1050688
      drop
      block $label3
        i32.const 704
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17ha99e3efb2d98b193E
        local.tee $var1
        i32.eqz
        br_if $label3
        local.get $var2
        i32.const 0
        i32.store offset=568
        local.get $var2
        local.get $var1
        i32.store offset=564
        local.get $var2
        i32.const 176
        i32.store offset=560
        i32.const 0
        local.set $var3
        loop $label8
          block $label6
            block $label4
              local.get $var3
              i32.const 4
              i32.lt_u
              br_if $label4
              local.get $var1
              local.get $var4
              i32.add
              local.tee $var7
              i32.const -4
              i32.add
              i32.load align=1
              local.set $var8
              local.get $var7
              i32.const -16
              i32.add
              i32.load align=1
              local.set $var7
              block $label5
                local.get $var3
                i32.const 3
                i32.and
                br_if $label5
                local.get $var5
                local.get $var3
                i32.add
                i32.load align=1
                local.get $var2
                i32.const 4
                i32.add
                local.get $var8
                i32.const 24
                i32.rotl
                local.tee $var8
                i32.const 8
                i32.shr_u
                i32.const 255
                i32.and
                i32.add
                i32.load8_u
                i32.const 8
                i32.shl
                local.get $var2
                i32.const 4
                i32.add
                local.get $var8
                i32.const 255
                i32.and
                i32.add
                i32.load8_u
                i32.or
                local.get $var2
                i32.const 4
                i32.add
                local.get $var8
                i32.const 16
                i32.shr_u
                i32.const 255
                i32.and
                i32.add
                i32.load8_u
                i32.const 16
                i32.shl
                i32.or
                local.get $var2
                i32.const 4
                i32.add
                local.get $var8
                i32.const 24
                i32.shr_u
                i32.add
                i32.load8_u
                i32.const 24
                i32.shl
                i32.or
                i32.xor
                local.get $var7
                i32.xor
                local.set $var7
                br $label6
              end $label5
              local.get $var8
              local.get $var7
              i32.xor
              local.set $var7
              br $label6
            end $label4
            local.get $var2
            i32.const 608
            i32.add
            local.get $var4
            i32.add
            i32.load align=1
            local.set $var7
          end $label6
          block $label7
            local.get $var3
            local.get $var2
            i32.load offset=560
            i32.ne
            br_if $label7
            local.get $var2
            i32.const 560
            i32.add
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hfe467b9c4e992157E
            local.get $var2
            i32.load offset=564
            local.set $var1
          end $label7
          local.get $var1
          local.get $var4
          i32.add
          local.get $var7
          i32.store align=1
          local.get $var2
          local.get $var3
          i32.const 1
          i32.add
          local.tee $var3
          i32.store offset=568
          local.get $var4
          i32.const 4
          i32.add
          local.set $var4
          local.get $var3
          i32.const 44
          i32.ne
          br_if $label8
        end $label8
        i32.const 0
        local.set $var7
        i32.const 0
        i32.load8_u offset=1050688
        drop
        local.get $var2
        i32.load offset=564
        local.set $var9
        local.get $var2
        i32.load offset=560
        local.set $var10
        block $label9
          i32.const 2816
          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17ha99e3efb2d98b193E
          local.tee $var11
          i32.eqz
          br_if $label9
          local.get $var2
          i32.const 0
          i32.store offset=636
          local.get $var2
          local.get $var11
          i32.store offset=632
          local.get $var2
          i32.const 176
          i32.store offset=628
          i32.const 44
          local.set $var8
          local.get $var2
          i32.const 560
          i32.add
          i32.const 8
          i32.add
          local.set $var12
          local.get $var9
          local.set $var5
          block $label10
            loop $label13
              local.get $var12
              i64.const 0
              i64.store
              local.get $var2
              i64.const 0
              i64.store offset=560
              local.get $var8
              local.get $var8
              i32.const 4
              local.get $var8
              i32.const 4
              i32.lt_u
              select
              local.tee $var13
              i32.sub
              local.set $var8
              local.get $var5
              local.tee $var1
              local.get $var13
              i32.const 2
              i32.shl
              local.tee $var4
              i32.add
              local.set $var5
              i32.const 0
              local.set $var3
              loop $label11
                local.get $var4
                local.get $var3
                i32.eq
                br_if $label10
                local.get $var2
                i32.const 560
                i32.add
                local.get $var3
                i32.add
                local.get $var1
                local.get $var3
                i32.add
                i32.load align=1
                i32.store align=1
                local.get $var3
                i32.const 4
                i32.add
                local.tee $var3
                i32.const 16
                i32.ne
                br_if $label11
              end $label11
              block $label12
                local.get $var7
                local.get $var2
                i32.load offset=628
                i32.ne
                br_if $label12
                local.get $var2
                i32.const 628
                i32.add
                call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h389f3fe9d02e3ce9E
                local.get $var2
                i32.load offset=632
                local.set $var11
              end $label12
              local.get $var11
              local.get $var7
              i32.const 4
              i32.shl
              i32.add
              local.tee $var3
              local.get $var2
              i64.load offset=560
              i64.store align=1
              local.get $var3
              i32.const 8
              i32.add
              local.get $var12
              i64.load
              i64.store align=1
              local.get $var2
              local.get $var7
              i32.const 1
              i32.add
              local.tee $var7
              i32.store offset=636
              local.get $var7
              i32.const 11
              i32.ne
              br_if $label13
            end $label13
            local.get $var0
            local.get $var2
            i64.load offset=628 align=4
            i64.store align=4
            local.get $var0
            i32.const 8
            i32.add
            local.get $var2
            i32.const 628
            i32.add
            i32.const 8
            i32.add
            i32.load
            i32.store
            block $label14
              local.get $var10
              i32.eqz
              br_if $label14
              local.get $var9
              local.get $var10
              i32.const 2
              i32.shl
              call $__rust_dealloc
            end $label14
            local.get $var6
            i32.const 16
            call $__rust_dealloc
            local.get $var0
            i32.const 10
            i32.store offset=12
            local.get $var2
            i32.const 640
            i32.add
            global.set $__stack_pointer
            return
          end $label10
          local.get $var13
          local.get $var13
          i32.const 1050404
          call $_ZN4core9panicking18panic_bounds_check17hc47765e3d10a3709E
          unreachable
        end $label9
        i32.const 1
        i32.const 2816
        call $_ZN5alloc7raw_vec12handle_error17h76131d670f53a5eeE
        unreachable
      end $label3
      i32.const 1
      i32.const 704
      call $_ZN5alloc7raw_vec12handle_error17h76131d670f53a5eeE
      unreachable
    end $label1
    i32.const 1
    i32.const 16
    call $_ZN5alloc7raw_vec12handle_error17h76131d670f53a5eeE
    unreachable
  )
  (func $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$7forward17hfd5db0927aa771b8E (;9;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    local.get $var0
    i32.load8_u offset=1
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label0
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 1
      i32.add
      local.get $var3
      i32.const 5
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label0
    end $label0
    local.get $var0
    local.get $var1
    i32.store8 offset=13
    local.get $var0
    i32.load8_u offset=2
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label1
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 2
      i32.add
      local.get $var3
      i32.const 6
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label1
    end $label1
    local.get $var0
    local.get $var1
    i32.store8 offset=14
    local.get $var0
    i32.load8_u offset=2
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label2
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 2
      i32.add
      local.get $var3
      i32.const 6
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label2
    end $label2
    local.get $var0
    local.get $var1
    i32.store8 offset=14
    local.get $var0
    i32.load8_u offset=3
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label3
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 3
      i32.add
      local.get $var3
      i32.const 7
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label3
    end $label3
    local.get $var0
    local.get $var1
    i32.store8 offset=15
    local.get $var0
    i32.load8_u offset=3
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label4
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 3
      i32.add
      local.get $var3
      i32.const 7
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label4
    end $label4
    local.get $var0
    local.get $var1
    i32.store8 offset=15
    local.get $var0
    i32.load8_u offset=3
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label5
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 3
      i32.add
      local.get $var3
      i32.const 7
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label5
    end $label5
    local.get $var0
    local.get $var1
    i32.store8 offset=15
  )
  (func $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h1f4168c6dfc810e9E (;10;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    (local $var4 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    local.get $var1
    i32.store offset=4
    local.get $var3
    local.get $var0
    i32.store
    local.get $var3
    i32.const 3
    i32.store offset=12
    local.get $var3
    i32.const 1049184
    i32.store offset=8
    local.get $var3
    i64.const 2
    i64.store offset=20 align=4
    local.get $var3
    i32.const 2
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $var4
    local.get $var3
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $var3
    local.get $var4
    local.get $var3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get $var3
    local.get $var3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get $var3
    i32.const 8
    i32.add
    local.get $var2
    call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
    unreachable
  )
  (func $_ZN4core9panicking18panic_bounds_check17hc47765e3d10a3709E (;11;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    (local $var4 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    local.get $var1
    i32.store offset=4
    local.get $var3
    local.get $var0
    i32.store
    local.get $var3
    i32.const 2
    i32.store offset=12
    local.get $var3
    i32.const 1048756
    i32.store offset=8
    local.get $var3
    i64.const 2
    i64.store offset=20 align=4
    local.get $var3
    i32.const 2
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $var4
    local.get $var3
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $var3
    local.get $var4
    local.get $var3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get $var3
    local.get $var3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get $var3
    i32.const 8
    i32.add
    local.get $var2
    call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
    unreachable
  )
  (func $decrypt_128 (;12;) (export "decrypt_128") (param $var0 i32) (param $var1 i32) (result i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    (local $var14 i32)
    (local $var15 i32)
    (local $var16 i32)
    (local $var17 i32)
    (local $var18 i32)
    (local $var19 i32)
    (local $var20 i32)
    (local $var21 i32)
    (local $var22 i32)
    (local $var23 i32)
    (local $var24 i32)
    (local $var25 i32)
    (local $var26 i32)
    (local $var27 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    block $label0
      i32.const 0
      i32.load8_u offset=1050684
      i32.const 3
      i32.eq
      br_if $label0
      local.get $var2
      i32.const 1050668
      i32.store offset=80
      local.get $var2
      i32.const 80
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17hf229ab053a1eb25aE
    end $label0
    local.get $var2
    i32.const 80
    i32.add
    call $_ZN3std4sync5mutex14Mutex$LT$T$GT$4lock17h1f3208a235323bdbE
    block $label2
      block $label1
        local.get $var2
        i32.load offset=84
        local.tee $var3
        i32.load offset=12
        local.tee $var4
        i32.eqz
        br_if $label1
        local.get $var3
        i32.const 4
        i32.add
        local.set $var5
        local.get $var4
        i32.const 3
        i32.shl
        local.set $var6
        i32.const 0
        local.set $var7
        local.get $var3
        i32.load offset=8
        local.tee $var8
        local.set $var9
        loop $label3
          local.get $var9
          i32.load
          local.get $var0
          i32.eq
          br_if $label2
          local.get $var7
          i32.const 1
          i32.add
          local.set $var7
          local.get $var9
          i32.const 8
          i32.add
          local.set $var9
          local.get $var6
          i32.const -8
          i32.add
          local.tee $var6
          br_if $label3
        end $label3
      end $label1
      i32.const 1049756
      i32.const 32
      i32.const 1049788
      call $_ZN4core6option13expect_failed17hacfbd4e0f8d6ca3bE
      unreachable
    end $label2
    block $label37
      block $label12
        block $label8
          block $label7
            block $label4
              local.get $var8
              local.get $var7
              i32.const 3
              i32.shl
              i32.add
              local.tee $var9
              i32.load offset=4
              local.tee $var7
              i32.const 16
              i32.ne
              br_if $label4
              local.get $var2
              i32.const 8
              i32.add
              local.get $var9
              i32.load
              local.tee $var9
              i32.const 8
              i32.add
              i64.load align=1
              i64.store
              local.get $var2
              local.get $var9
              i64.load align=1
              i64.store
              local.get $var4
              i32.const 3
              i32.shl
              local.set $var6
              i32.const 0
              local.set $var7
              local.get $var8
              local.set $var9
              block $label5
                loop $label6
                  local.get $var9
                  i32.load
                  local.get $var1
                  i32.eq
                  br_if $label5
                  local.get $var7
                  i32.const 1
                  i32.add
                  local.set $var7
                  local.get $var9
                  i32.const 8
                  i32.add
                  local.set $var9
                  local.get $var6
                  i32.const -8
                  i32.add
                  local.tee $var6
                  br_if $label6
                end $label6
                i32.const 1049756
                i32.const 32
                i32.const 1049788
                call $_ZN4core6option13expect_failed17hacfbd4e0f8d6ca3bE
                unreachable
              end $label5
              local.get $var8
              local.get $var7
              i32.const 3
              i32.shl
              i32.add
              local.tee $var9
              i32.load offset=4
              local.tee $var7
              i32.const 16
              i32.ne
              br_if $label7
              local.get $var2
              i32.const 16
              i32.add
              i32.const 8
              i32.add
              local.get $var9
              i32.load
              local.tee $var9
              i32.const 8
              i32.add
              i64.load align=1
              i64.store
              local.get $var2
              local.get $var9
              i64.load align=1
              i64.store offset=16
              local.get $var2
              i32.const 32
              i32.add
              local.get $var2
              i32.const 16
              i32.add
              call $_ZN8programs3aes6cipher3Aes16with_128_bit_key17h065b4bafe4cba77cE
              local.get $var2
              i32.const 64
              i32.add
              i32.const 8
              i32.add
              local.get $var2
              i32.const 8
              i32.add
              i64.load
              i64.store
              local.get $var2
              local.get $var2
              i64.load
              i64.store offset=64
              local.get $var2
              i32.load offset=40
              local.tee $var10
              local.get $var2
              i32.load offset=44
              local.tee $var11
              i32.le_u
              br_if $label8
              local.get $var2
              i32.const 80
              i32.add
              i32.const 8
              i32.add
              local.get $var2
              i32.load offset=36
              local.tee $var12
              local.get $var11
              i32.const 4
              i32.shl
              i32.add
              local.tee $var9
              i32.const 8
              i32.add
              i64.load align=1
              i64.store
              local.get $var2
              local.get $var9
              i64.load align=1
              i64.store offset=80
              i32.const 0
              local.set $var9
              loop $label9
                local.get $var2
                i32.const 64
                i32.add
                local.get $var9
                i32.add
                local.tee $var7
                local.get $var7
                i32.load8_u
                local.get $var2
                i32.const 80
                i32.add
                local.get $var9
                i32.add
                i32.load8_u
                i32.xor
                i32.store8
                local.get $var9
                i32.const 1
                i32.add
                local.tee $var9
                i32.const 16
                i32.ne
                br_if $label9
              end $label9
              local.get $var2
              i32.const 64
              i32.add
              call $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$8backward17h4e4c2a4506264088E
              i32.const 0
              local.set $var9
              loop $label10
                local.get $var2
                i32.const 64
                i32.add
                local.get $var9
                i32.add
                local.tee $var7
                local.get $var7
                i32.load8_u
                i32.const 1050108
                i32.add
                i32.load8_u
                i32.store8
                local.get $var9
                i32.const 1
                i32.add
                local.tee $var9
                i32.const 16
                i32.ne
                br_if $label10
              end $label10
              block $label11
                local.get $var11
                i32.const 2
                i32.lt_u
                br_if $label11
                loop $label32
                  local.get $var10
                  local.get $var11
                  i32.const -1
                  i32.add
                  local.tee $var11
                  i32.le_u
                  br_if $label12
                  local.get $var2
                  i32.const 80
                  i32.add
                  i32.const 8
                  i32.add
                  local.get $var12
                  local.get $var11
                  i32.const 4
                  i32.shl
                  i32.add
                  local.tee $var9
                  i32.const 8
                  i32.add
                  i64.load align=1
                  i64.store
                  local.get $var2
                  local.get $var9
                  i64.load align=1
                  i64.store offset=80
                  i32.const 0
                  local.set $var9
                  loop $label13
                    local.get $var2
                    i32.const 64
                    i32.add
                    local.get $var9
                    i32.add
                    local.tee $var7
                    local.get $var7
                    i32.load8_u
                    local.get $var2
                    i32.const 80
                    i32.add
                    local.get $var9
                    i32.add
                    i32.load8_u
                    i32.xor
                    i32.store8
                    local.get $var9
                    i32.const 1
                    i32.add
                    local.tee $var9
                    i32.const 16
                    i32.ne
                    br_if $label13
                  end $label13
                  i32.const 0
                  local.set $var13
                  loop $label30
                    i32.const 14
                    local.set $var6
                    i32.const 8
                    local.set $var0
                    local.get $var2
                    i32.const 64
                    i32.add
                    local.get $var13
                    i32.const 2
                    i32.shl
                    i32.add
                    local.tee $var14
                    i32.load8_u
                    local.tee $var9
                    local.set $var7
                    i32.const 0
                    local.set $var4
                    loop $label14
                      i32.const 0
                      local.get $var6
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var7
                      i32.and
                      local.get $var4
                      i32.xor
                      local.set $var4
                      local.get $var7
                      i32.const 1
                      i32.shl
                      local.tee $var1
                      i32.const 27
                      i32.xor
                      local.get $var1
                      local.get $var7
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var7
                      local.get $var6
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var6
                      local.get $var0
                      i32.const -1
                      i32.add
                      local.tee $var0
                      br_if $label14
                    end $label14
                    i32.const 0
                    local.set $var15
                    i32.const 11
                    local.set $var0
                    i32.const 8
                    local.set $var1
                    local.get $var14
                    i32.load8_u offset=1
                    local.tee $var7
                    local.set $var6
                    loop $label15
                      i32.const 0
                      local.get $var0
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var6
                      i32.and
                      local.get $var15
                      i32.xor
                      local.set $var15
                      local.get $var6
                      i32.const 1
                      i32.shl
                      local.tee $var8
                      i32.const 27
                      i32.xor
                      local.get $var8
                      local.get $var6
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var6
                      local.get $var0
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var0
                      local.get $var1
                      i32.const -1
                      i32.add
                      local.tee $var1
                      br_if $label15
                    end $label15
                    i32.const 0
                    local.set $var16
                    i32.const 13
                    local.set $var1
                    i32.const 8
                    local.set $var8
                    local.get $var14
                    i32.load8_u offset=2
                    local.tee $var6
                    local.set $var0
                    loop $label16
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var16
                      i32.xor
                      local.set $var16
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var17
                      i32.const 27
                      i32.xor
                      local.get $var17
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var8
                      i32.const -1
                      i32.add
                      local.tee $var8
                      br_if $label16
                    end $label16
                    i32.const 0
                    local.set $var17
                    i32.const 9
                    local.set $var8
                    i32.const 8
                    local.set $var18
                    local.get $var14
                    i32.load8_u offset=3
                    local.tee $var0
                    local.set $var1
                    loop $label17
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var17
                      i32.xor
                      local.set $var17
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var19
                      i32.const 27
                      i32.xor
                      local.get $var19
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var18
                      i32.const -1
                      i32.add
                      local.tee $var18
                      br_if $label17
                    end $label17
                    i32.const 0
                    local.set $var18
                    i32.const 14
                    local.set $var8
                    i32.const 8
                    local.set $var19
                    local.get $var7
                    local.set $var1
                    loop $label18
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var18
                      i32.xor
                      local.set $var18
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var20
                      i32.const 27
                      i32.xor
                      local.get $var20
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var19
                      i32.const -1
                      i32.add
                      local.tee $var19
                      br_if $label18
                    end $label18
                    i32.const 0
                    local.set $var19
                    i32.const 11
                    local.set $var8
                    i32.const 8
                    local.set $var20
                    local.get $var6
                    local.set $var1
                    loop $label19
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var19
                      i32.xor
                      local.set $var19
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var21
                      i32.const 27
                      i32.xor
                      local.get $var21
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var20
                      i32.const -1
                      i32.add
                      local.tee $var20
                      br_if $label19
                    end $label19
                    i32.const 0
                    local.set $var20
                    i32.const 13
                    local.set $var8
                    i32.const 8
                    local.set $var21
                    local.get $var0
                    local.set $var1
                    loop $label20
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var20
                      i32.xor
                      local.set $var20
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var22
                      i32.const 27
                      i32.xor
                      local.get $var22
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var21
                      i32.const -1
                      i32.add
                      local.tee $var21
                      br_if $label20
                    end $label20
                    i32.const 0
                    local.set $var21
                    i32.const 9
                    local.set $var8
                    i32.const 8
                    local.set $var22
                    local.get $var9
                    local.set $var1
                    loop $label21
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var21
                      i32.xor
                      local.set $var21
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var23
                      i32.const 27
                      i32.xor
                      local.get $var23
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var22
                      i32.const -1
                      i32.add
                      local.tee $var22
                      br_if $label21
                    end $label21
                    i32.const 0
                    local.set $var22
                    i32.const 14
                    local.set $var8
                    i32.const 8
                    local.set $var23
                    local.get $var6
                    local.set $var1
                    loop $label22
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var22
                      i32.xor
                      local.set $var22
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var24
                      i32.const 27
                      i32.xor
                      local.get $var24
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var23
                      i32.const -1
                      i32.add
                      local.tee $var23
                      br_if $label22
                    end $label22
                    i32.const 0
                    local.set $var23
                    i32.const 11
                    local.set $var8
                    i32.const 8
                    local.set $var24
                    local.get $var0
                    local.set $var1
                    loop $label23
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var23
                      i32.xor
                      local.set $var23
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var25
                      i32.const 27
                      i32.xor
                      local.get $var25
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var24
                      i32.const -1
                      i32.add
                      local.tee $var24
                      br_if $label23
                    end $label23
                    i32.const 0
                    local.set $var24
                    i32.const 13
                    local.set $var8
                    i32.const 8
                    local.set $var25
                    local.get $var9
                    local.set $var1
                    loop $label24
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var24
                      i32.xor
                      local.set $var24
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var26
                      i32.const 27
                      i32.xor
                      local.get $var26
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var25
                      i32.const -1
                      i32.add
                      local.tee $var25
                      br_if $label24
                    end $label24
                    i32.const 0
                    local.set $var25
                    i32.const 9
                    local.set $var8
                    i32.const 8
                    local.set $var26
                    local.get $var7
                    local.set $var1
                    loop $label25
                      i32.const 0
                      local.get $var8
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var1
                      i32.and
                      local.get $var25
                      i32.xor
                      local.set $var25
                      local.get $var1
                      i32.const 1
                      i32.shl
                      local.tee $var27
                      i32.const 27
                      i32.xor
                      local.get $var27
                      local.get $var1
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var1
                      local.get $var8
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var8
                      local.get $var26
                      i32.const -1
                      i32.add
                      local.tee $var26
                      br_if $label25
                    end $label25
                    i32.const 0
                    local.set $var8
                    i32.const 14
                    local.set $var1
                    i32.const 8
                    local.set $var26
                    loop $label26
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var8
                      i32.xor
                      local.set $var8
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var27
                      i32.const 27
                      i32.xor
                      local.get $var27
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var26
                      i32.const -1
                      i32.add
                      local.tee $var26
                      br_if $label26
                    end $label26
                    i32.const 0
                    local.set $var1
                    i32.const 11
                    local.set $var0
                    i32.const 8
                    local.set $var26
                    loop $label27
                      i32.const 0
                      local.get $var0
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var9
                      i32.and
                      local.get $var1
                      i32.xor
                      local.set $var1
                      local.get $var9
                      i32.const 1
                      i32.shl
                      local.tee $var27
                      i32.const 27
                      i32.xor
                      local.get $var27
                      local.get $var9
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var9
                      local.get $var0
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var0
                      local.get $var26
                      i32.const -1
                      i32.add
                      local.tee $var26
                      br_if $label27
                    end $label27
                    i32.const 0
                    local.set $var0
                    i32.const 13
                    local.set $var9
                    i32.const 8
                    local.set $var26
                    loop $label28
                      i32.const 0
                      local.get $var9
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var7
                      i32.and
                      local.get $var0
                      i32.xor
                      local.set $var0
                      local.get $var7
                      i32.const 1
                      i32.shl
                      local.tee $var27
                      i32.const 27
                      i32.xor
                      local.get $var27
                      local.get $var7
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var7
                      local.get $var9
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var9
                      local.get $var26
                      i32.const -1
                      i32.add
                      local.tee $var26
                      br_if $label28
                    end $label28
                    i32.const 0
                    local.set $var7
                    i32.const 9
                    local.set $var9
                    i32.const 8
                    local.set $var26
                    loop $label29
                      i32.const 0
                      local.get $var9
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var6
                      i32.and
                      local.get $var7
                      i32.xor
                      local.set $var7
                      local.get $var6
                      i32.const 1
                      i32.shl
                      local.tee $var27
                      i32.const 27
                      i32.xor
                      local.get $var27
                      local.get $var6
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var6
                      local.get $var9
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var9
                      local.get $var26
                      i32.const -1
                      i32.add
                      local.tee $var26
                      br_if $label29
                    end $label29
                    local.get $var14
                    local.get $var1
                    local.get $var8
                    i32.xor
                    local.get $var0
                    i32.xor
                    local.get $var7
                    i32.xor
                    i32.store8 offset=3
                    local.get $var14
                    local.get $var23
                    local.get $var22
                    i32.xor
                    local.get $var24
                    i32.xor
                    local.get $var25
                    i32.xor
                    i32.store8 offset=2
                    local.get $var14
                    local.get $var19
                    local.get $var18
                    i32.xor
                    local.get $var20
                    i32.xor
                    local.get $var21
                    i32.xor
                    i32.store8 offset=1
                    local.get $var14
                    local.get $var15
                    local.get $var4
                    i32.xor
                    local.get $var16
                    i32.xor
                    local.get $var17
                    i32.xor
                    i32.store8
                    local.get $var13
                    i32.const 1
                    i32.add
                    local.tee $var13
                    i32.const 4
                    i32.ne
                    br_if $label30
                  end $label30
                  local.get $var2
                  i32.const 64
                  i32.add
                  call $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$8backward17h4e4c2a4506264088E
                  i32.const 0
                  local.set $var9
                  loop $label31
                    local.get $var2
                    i32.const 64
                    i32.add
                    local.get $var9
                    i32.add
                    local.tee $var7
                    local.get $var7
                    i32.load8_u
                    i32.const 1050108
                    i32.add
                    i32.load8_u
                    i32.store8
                    local.get $var9
                    i32.const 1
                    i32.add
                    local.tee $var9
                    i32.const 16
                    i32.ne
                    br_if $label31
                  end $label31
                  local.get $var11
                  i32.const 1
                  i32.gt_u
                  br_if $label32
                end $label32
              end $label11
              local.get $var2
              i32.const 80
              i32.add
              i32.const 8
              i32.add
              local.get $var12
              i32.const 8
              i32.add
              i64.load align=1
              i64.store
              local.get $var2
              local.get $var12
              i64.load align=1
              i64.store offset=80
              i32.const 0
              local.set $var9
              loop $label33
                local.get $var2
                i32.const 64
                i32.add
                local.get $var9
                i32.add
                local.tee $var7
                local.get $var7
                i32.load8_u
                local.get $var2
                i32.const 80
                i32.add
                local.get $var9
                i32.add
                i32.load8_u
                i32.xor
                i32.store8
                local.get $var9
                i32.const 1
                i32.add
                local.tee $var9
                i32.const 16
                i32.ne
                br_if $label33
              end $label33
              local.get $var2
              i32.const 48
              i32.add
              i32.const 8
              i32.add
              local.get $var2
              i32.const 64
              i32.add
              i32.const 8
              i32.add
              i64.load
              i64.store
              local.get $var2
              local.get $var2
              i64.load offset=64
              i64.store offset=48
              local.get $var5
              i32.const 16
              call $_ZN8programs3aes5Arena8allocate17h9dfa44881955881aE
              local.set $var0
              block $label35
                block $label34
                  local.get $var3
                  i32.load offset=12
                  local.tee $var9
                  i32.eqz
                  br_if $label34
                  local.get $var9
                  i32.const 3
                  i32.shl
                  local.set $var6
                  i32.const 0
                  local.set $var7
                  local.get $var3
                  i32.load offset=8
                  local.tee $var1
                  local.set $var9
                  loop $label36
                    local.get $var9
                    i32.load
                    local.get $var0
                    i32.eq
                    br_if $label35
                    local.get $var7
                    i32.const 1
                    i32.add
                    local.set $var7
                    local.get $var9
                    i32.const 8
                    i32.add
                    local.set $var9
                    local.get $var6
                    i32.const -8
                    i32.add
                    local.tee $var6
                    br_if $label36
                  end $label36
                end $label34
                i32.const 1049756
                i32.const 32
                i32.const 1049788
                call $_ZN4core6option13expect_failed17hacfbd4e0f8d6ca3bE
                unreachable
              end $label35
              local.get $var1
              local.get $var7
              i32.const 3
              i32.shl
              i32.add
              local.tee $var9
              i32.load offset=4
              local.tee $var7
              i32.const 16
              i32.ne
              br_if $label37
              local.get $var9
              i32.load
              local.tee $var9
              local.get $var2
              i64.load offset=48
              i64.store align=1
              local.get $var9
              i32.const 8
              i32.add
              local.get $var2
              i32.const 48
              i32.add
              i32.const 8
              i32.add
              i64.load
              i64.store align=1
              block $label38
                local.get $var2
                i32.load offset=32
                local.tee $var9
                i32.eqz
                br_if $label38
                local.get $var12
                local.get $var9
                i32.const 4
                i32.shl
                call $__rust_dealloc
              end $label38
              local.get $var3
              i32.const 0
              i32.store8
              local.get $var2
              i32.const 96
              i32.add
              global.set $__stack_pointer
              local.get $var0
              return
            end $label4
            i32.const 16
            local.get $var7
            i32.const 1049740
            call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h1f4168c6dfc810e9E
            unreachable
          end $label7
          i32.const 16
          local.get $var7
          i32.const 1049740
          call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h1f4168c6dfc810e9E
          unreachable
        end $label8
        local.get $var11
        local.get $var10
        i32.const 1050468
        call $_ZN4core9panicking18panic_bounds_check17hc47765e3d10a3709E
        unreachable
      end $label12
      local.get $var11
      local.get $var10
      i32.const 1050484
      call $_ZN4core9panicking18panic_bounds_check17hc47765e3d10a3709E
      unreachable
    end $label37
    local.get $var7
    i32.const 16
    i32.const 1049724
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h1f4168c6dfc810e9E
    unreachable
  )
  (func $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$8backward17h4e4c2a4506264088E (;13;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    local.get $var0
    i32.load8_u offset=1
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label0
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 1
      i32.add
      local.get $var3
      i32.const 5
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label0
    end $label0
    local.get $var0
    local.get $var1
    i32.store8 offset=13
    local.get $var0
    i32.load8_u offset=1
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label1
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 1
      i32.add
      local.get $var3
      i32.const 5
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label1
    end $label1
    local.get $var0
    local.get $var1
    i32.store8 offset=13
    local.get $var0
    i32.load8_u offset=1
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label2
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 1
      i32.add
      local.get $var3
      i32.const 5
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label2
    end $label2
    local.get $var0
    local.get $var1
    i32.store8 offset=13
    local.get $var0
    i32.load8_u offset=2
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label3
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 2
      i32.add
      local.get $var3
      i32.const 6
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label3
    end $label3
    local.get $var0
    local.get $var1
    i32.store8 offset=14
    local.get $var0
    i32.load8_u offset=2
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label4
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 2
      i32.add
      local.get $var3
      i32.const 6
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label4
    end $label4
    local.get $var0
    local.get $var1
    i32.store8 offset=14
    local.get $var0
    i32.load8_u offset=3
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label5
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 3
      i32.add
      local.get $var3
      i32.const 7
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label5
    end $label5
    local.get $var0
    local.get $var1
    i32.store8 offset=15
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17h00ce677e36b4e209E (;14;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    local.get $var0
    i32.const -8
    i32.add
    local.tee $var1
    local.get $var0
    i32.const -4
    i32.add
    i32.load
    local.tee $var2
    i32.const -8
    i32.and
    local.tee $var0
    i32.add
    local.set $var3
    block $label1
      block $label0
        local.get $var2
        i32.const 1
        i32.and
        br_if $label0
        local.get $var2
        i32.const 2
        i32.and
        i32.eqz
        br_if $label1
        local.get $var1
        i32.load
        local.tee $var2
        local.get $var0
        i32.add
        local.set $var0
        block $label2
          local.get $var1
          local.get $var2
          i32.sub
          local.tee $var1
          i32.const 0
          i32.load offset=1051124
          i32.ne
          br_if $label2
          local.get $var3
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if $label0
          i32.const 0
          local.get $var0
          i32.store offset=1051116
          local.get $var3
          local.get $var3
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get $var1
          local.get $var0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var3
          local.get $var0
          i32.store
          return
        end $label2
        local.get $var1
        local.get $var2
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hcaef18d57bcc0f93E
      end $label0
      block $label11
        block $label7
          block $label5
            block $label4
              block $label6
                block $label3
                  local.get $var3
                  i32.load offset=4
                  local.tee $var2
                  i32.const 2
                  i32.and
                  br_if $label3
                  local.get $var3
                  i32.const 0
                  i32.load offset=1051128
                  i32.eq
                  br_if $label4
                  local.get $var3
                  i32.const 0
                  i32.load offset=1051124
                  i32.eq
                  br_if $label5
                  local.get $var3
                  local.get $var2
                  i32.const -8
                  i32.and
                  local.tee $var2
                  call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hcaef18d57bcc0f93E
                  local.get $var1
                  local.get $var2
                  local.get $var0
                  i32.add
                  local.tee $var0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var1
                  local.get $var0
                  i32.add
                  local.get $var0
                  i32.store
                  local.get $var1
                  i32.const 0
                  i32.load offset=1051124
                  i32.ne
                  br_if $label6
                  i32.const 0
                  local.get $var0
                  i32.store offset=1051116
                  return
                end $label3
                local.get $var3
                local.get $var2
                i32.const -2
                i32.and
                i32.store offset=4
                local.get $var1
                local.get $var0
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $var1
                local.get $var0
                i32.add
                local.get $var0
                i32.store
              end $label6
              local.get $var0
              i32.const 256
              i32.lt_u
              br_if $label7
              local.get $var1
              local.get $var0
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hed6bdaacb86779faE
              i32.const 0
              local.set $var1
              i32.const 0
              i32.const 0
              i32.load offset=1051148
              i32.const -1
              i32.add
              local.tee $var0
              i32.store offset=1051148
              local.get $var0
              br_if $label1
              block $label8
                i32.const 0
                i32.load offset=1050836
                local.tee $var0
                i32.eqz
                br_if $label8
                i32.const 0
                local.set $var1
                loop $label9
                  local.get $var1
                  i32.const 1
                  i32.add
                  local.set $var1
                  local.get $var0
                  i32.load offset=8
                  local.tee $var0
                  br_if $label9
                end $label9
              end $label8
              i32.const 0
              local.get $var1
              i32.const 4095
              local.get $var1
              i32.const 4095
              i32.gt_u
              select
              i32.store offset=1051148
              return
            end $label4
            i32.const 0
            local.get $var1
            i32.store offset=1051128
            i32.const 0
            i32.const 0
            i32.load offset=1051120
            local.get $var0
            i32.add
            local.tee $var0
            i32.store offset=1051120
            local.get $var1
            local.get $var0
            i32.const 1
            i32.or
            i32.store offset=4
            block $label10
              local.get $var1
              i32.const 0
              i32.load offset=1051124
              i32.ne
              br_if $label10
              i32.const 0
              i32.const 0
              i32.store offset=1051116
              i32.const 0
              i32.const 0
              i32.store offset=1051124
            end $label10
            local.get $var0
            i32.const 0
            i32.load offset=1051140
            local.tee $var4
            i32.le_u
            br_if $label1
            i32.const 0
            i32.load offset=1051128
            local.tee $var0
            i32.eqz
            br_if $label1
            i32.const 0
            local.set $var2
            i32.const 0
            i32.load offset=1051120
            local.tee $var5
            i32.const 41
            i32.lt_u
            br_if $label11
            i32.const 1050828
            local.set $var1
            loop $label13
              block $label12
                local.get $var1
                i32.load
                local.tee $var3
                local.get $var0
                i32.gt_u
                br_if $label12
                local.get $var0
                local.get $var3
                local.get $var1
                i32.load offset=4
                i32.add
                i32.lt_u
                br_if $label11
              end $label12
              local.get $var1
              i32.load offset=8
              local.set $var1
              br $label13
            end $label13
          end $label5
          i32.const 0
          local.get $var1
          i32.store offset=1051124
          i32.const 0
          i32.const 0
          i32.load offset=1051116
          local.get $var0
          i32.add
          local.tee $var0
          i32.store offset=1051116
          local.get $var1
          local.get $var0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var1
          local.get $var0
          i32.add
          local.get $var0
          i32.store
          return
        end $label7
        local.get $var0
        i32.const -8
        i32.and
        i32.const 1050844
        i32.add
        local.set $var3
        block $label15
          block $label14
            i32.const 0
            i32.load offset=1051108
            local.tee $var2
            i32.const 1
            local.get $var0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee $var0
            i32.and
            br_if $label14
            i32.const 0
            local.get $var2
            local.get $var0
            i32.or
            i32.store offset=1051108
            local.get $var3
            local.set $var0
            br $label15
          end $label14
          local.get $var3
          i32.load offset=8
          local.set $var0
        end $label15
        local.get $var3
        local.get $var1
        i32.store offset=8
        local.get $var0
        local.get $var1
        i32.store offset=12
        local.get $var1
        local.get $var3
        i32.store offset=12
        local.get $var1
        local.get $var0
        i32.store offset=8
        return
      end $label11
      block $label16
        i32.const 0
        i32.load offset=1050836
        local.tee $var1
        i32.eqz
        br_if $label16
        i32.const 0
        local.set $var2
        loop $label17
          local.get $var2
          i32.const 1
          i32.add
          local.set $var2
          local.get $var1
          i32.load offset=8
          local.tee $var1
          br_if $label17
        end $label17
      end $label16
      i32.const 0
      local.get $var2
      i32.const 4095
      local.get $var2
      i32.const 4095
      i32.gt_u
      select
      i32.store offset=1051148
      local.get $var5
      local.get $var4
      i32.le_u
      br_if $label1
      i32.const 0
      i32.const -1
      i32.store offset=1051140
    end $label1
  )
  (func $_ZN4core9panicking5panic17hcaca2598a27ec0fcE (;15;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    i32.const 0
    i32.store offset=16
    local.get $var3
    i32.const 1
    i32.store offset=4
    local.get $var3
    i64.const 4
    i64.store offset=8 align=4
    local.get $var3
    local.get $var1
    i32.store offset=28
    local.get $var3
    local.get $var0
    i32.store offset=24
    local.get $var3
    local.get $var3
    i32.const 24
    i32.add
    i32.store
    local.get $var3
    local.get $var2
    call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
    unreachable
  )
  (func $__rust_realloc (;16;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    block $label12
      block $label2
        block $label0
          local.get $var0
          i32.const -4
          i32.add
          local.tee $var3
          i32.load
          local.tee $var4
          i32.const -8
          i32.and
          local.tee $var5
          i32.const 4
          i32.const 8
          local.get $var4
          i32.const 3
          i32.and
          local.tee $var6
          select
          local.get $var1
          i32.add
          i32.lt_u
          br_if $label0
          block $label1
            local.get $var6
            i32.eqz
            br_if $label1
            local.get $var5
            local.get $var1
            i32.const 39
            i32.add
            i32.gt_u
            br_if $label2
          end $label1
          i32.const 16
          local.get $var2
          i32.const 11
          i32.add
          i32.const -8
          i32.and
          local.get $var2
          i32.const 11
          i32.lt_u
          select
          local.set $var1
          block $label5
            block $label4
              block $label3
                local.get $var6
                br_if $label3
                local.get $var1
                i32.const 256
                i32.lt_u
                br_if $label4
                local.get $var5
                local.get $var1
                i32.const 4
                i32.or
                i32.lt_u
                br_if $label4
                local.get $var5
                local.get $var1
                i32.sub
                i32.const 131073
                i32.ge_u
                br_if $label4
                br $label5
              end $label3
              local.get $var0
              i32.const -8
              i32.add
              local.tee $var7
              local.get $var5
              i32.add
              local.set $var6
              block $label7
                block $label8
                  block $label9
                    block $label6
                      local.get $var5
                      local.get $var1
                      i32.ge_u
                      br_if $label6
                      local.get $var6
                      i32.const 0
                      i32.load offset=1051128
                      i32.eq
                      br_if $label7
                      local.get $var6
                      i32.const 0
                      i32.load offset=1051124
                      i32.eq
                      br_if $label8
                      local.get $var6
                      i32.load offset=4
                      local.tee $var4
                      i32.const 2
                      i32.and
                      br_if $label4
                      local.get $var4
                      i32.const -8
                      i32.and
                      local.tee $var4
                      local.get $var5
                      i32.add
                      local.tee $var5
                      local.get $var1
                      i32.lt_u
                      br_if $label4
                      local.get $var6
                      local.get $var4
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hcaef18d57bcc0f93E
                      local.get $var5
                      local.get $var1
                      i32.sub
                      local.tee $var2
                      i32.const 16
                      i32.lt_u
                      br_if $label9
                      local.get $var3
                      local.get $var1
                      local.get $var3
                      i32.load
                      i32.const 1
                      i32.and
                      i32.or
                      i32.const 2
                      i32.or
                      i32.store
                      local.get $var7
                      local.get $var1
                      i32.add
                      local.tee $var1
                      local.get $var2
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get $var7
                      local.get $var5
                      i32.add
                      local.tee $var5
                      local.get $var5
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var1
                      local.get $var2
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17haf433297d8e77a90E
                      local.get $var0
                      return
                    end $label6
                    local.get $var5
                    local.get $var1
                    i32.sub
                    local.tee $var2
                    i32.const 15
                    i32.le_u
                    br_if $label5
                    local.get $var3
                    local.get $var1
                    local.get $var4
                    i32.const 1
                    i32.and
                    i32.or
                    i32.const 2
                    i32.or
                    i32.store
                    local.get $var7
                    local.get $var1
                    i32.add
                    local.tee $var5
                    local.get $var2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $var6
                    local.get $var6
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get $var5
                    local.get $var2
                    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17haf433297d8e77a90E
                    local.get $var0
                    return
                  end $label9
                  local.get $var3
                  local.get $var5
                  local.get $var3
                  i32.load
                  i32.const 1
                  i32.and
                  i32.or
                  i32.const 2
                  i32.or
                  i32.store
                  local.get $var7
                  local.get $var5
                  i32.add
                  local.tee $var2
                  local.get $var2
                  i32.load offset=4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var0
                  return
                end $label8
                i32.const 0
                i32.load offset=1051116
                local.get $var5
                i32.add
                local.tee $var5
                local.get $var1
                i32.lt_u
                br_if $label4
                block $label11
                  block $label10
                    local.get $var5
                    local.get $var1
                    i32.sub
                    local.tee $var2
                    i32.const 15
                    i32.gt_u
                    br_if $label10
                    local.get $var3
                    local.get $var4
                    i32.const 1
                    i32.and
                    local.get $var5
                    i32.or
                    i32.const 2
                    i32.or
                    i32.store
                    local.get $var7
                    local.get $var5
                    i32.add
                    local.tee $var2
                    local.get $var2
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    i32.const 0
                    local.set $var2
                    i32.const 0
                    local.set $var1
                    br $label11
                  end $label10
                  local.get $var3
                  local.get $var1
                  local.get $var4
                  i32.const 1
                  i32.and
                  i32.or
                  i32.const 2
                  i32.or
                  i32.store
                  local.get $var7
                  local.get $var1
                  i32.add
                  local.tee $var1
                  local.get $var2
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var7
                  local.get $var5
                  i32.add
                  local.tee $var5
                  local.get $var2
                  i32.store
                  local.get $var5
                  local.get $var5
                  i32.load offset=4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                end $label11
                i32.const 0
                local.get $var1
                i32.store offset=1051124
                i32.const 0
                local.get $var2
                i32.store offset=1051116
                local.get $var0
                return
              end $label7
              i32.const 0
              i32.load offset=1051120
              local.get $var5
              i32.add
              local.tee $var5
              local.get $var1
              i32.gt_u
              br_if $label12
            end $label4
            block $label13
              local.get $var2
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17ha99e3efb2d98b193E
              local.tee $var5
              br_if $label13
              i32.const 0
              return
            end $label13
            local.get $var5
            local.get $var0
            i32.const -4
            i32.const -8
            local.get $var3
            i32.load
            local.tee $var1
            i32.const 3
            i32.and
            select
            local.get $var1
            i32.const -8
            i32.and
            i32.add
            local.tee $var1
            local.get $var2
            local.get $var1
            local.get $var2
            i32.lt_u
            select
            call $memcpy
            local.set $var2
            local.get $var0
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17h00ce677e36b4e209E
            local.get $var2
            local.set $var0
          end $label5
          local.get $var0
          return
        end $label0
        i32.const 1050541
        i32.const 46
        i32.const 1050588
        call $_ZN4core9panicking5panic17hcaca2598a27ec0fcE
        unreachable
      end $label2
      i32.const 1050604
      i32.const 46
      i32.const 1050652
      call $_ZN4core9panicking5panic17hcaca2598a27ec0fcE
      unreachable
    end $label12
    local.get $var3
    local.get $var1
    local.get $var4
    i32.const 1
    i32.and
    i32.or
    i32.const 2
    i32.or
    i32.store
    local.get $var7
    local.get $var1
    i32.add
    local.tee $var2
    local.get $var5
    local.get $var1
    i32.sub
    local.tee $var5
    i32.const 1
    i32.or
    i32.store offset=4
    i32.const 0
    local.get $var5
    i32.store offset=1051120
    i32.const 0
    local.get $var2
    i32.store offset=1051128
    local.get $var0
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hcaef18d57bcc0f93E (;17;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    local.get $var0
    i32.load offset=12
    local.set $var2
    block $label5
      block $label7
        block $label0
          local.get $var1
          i32.const 256
          i32.lt_u
          br_if $label0
          local.get $var0
          i32.load offset=24
          local.set $var3
          block $label3
            block $label2
              block $label1
                local.get $var2
                local.get $var0
                i32.ne
                br_if $label1
                local.get $var0
                i32.const 20
                i32.const 16
                local.get $var0
                i32.load offset=20
                local.tee $var2
                select
                i32.add
                i32.load
                local.tee $var1
                br_if $label2
                i32.const 0
                local.set $var2
                br $label3
              end $label1
              local.get $var0
              i32.load offset=8
              local.tee $var1
              local.get $var2
              i32.store offset=12
              local.get $var2
              local.get $var1
              i32.store offset=8
              br $label3
            end $label2
            local.get $var0
            i32.const 20
            i32.add
            local.get $var0
            i32.const 16
            i32.add
            local.get $var2
            select
            local.set $var4
            loop $label4
              local.get $var4
              local.set $var5
              local.get $var1
              local.tee $var2
              i32.const 20
              i32.add
              local.get $var2
              i32.const 16
              i32.add
              local.get $var2
              i32.load offset=20
              local.tee $var1
              select
              local.set $var4
              local.get $var2
              i32.const 20
              i32.const 16
              local.get $var1
              select
              i32.add
              i32.load
              local.tee $var1
              br_if $label4
            end $label4
            local.get $var5
            i32.const 0
            i32.store
          end $label3
          local.get $var3
          i32.eqz
          br_if $label5
          block $label6
            local.get $var0
            i32.load offset=28
            i32.const 2
            i32.shl
            i32.const 1050700
            i32.add
            local.tee $var1
            i32.load
            local.get $var0
            i32.eq
            br_if $label6
            local.get $var3
            i32.const 16
            i32.const 20
            local.get $var3
            i32.load offset=16
            local.get $var0
            i32.eq
            select
            i32.add
            local.get $var2
            i32.store
            local.get $var2
            i32.eqz
            br_if $label5
            br $label7
          end $label6
          local.get $var1
          local.get $var2
          i32.store
          local.get $var2
          br_if $label7
          i32.const 0
          i32.const 0
          i32.load offset=1051112
          i32.const -2
          local.get $var0
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1051112
          br $label5
        end $label0
        block $label8
          local.get $var2
          local.get $var0
          i32.load offset=8
          local.tee $var4
          i32.eq
          br_if $label8
          local.get $var4
          local.get $var2
          i32.store offset=12
          local.get $var2
          local.get $var4
          i32.store offset=8
          return
        end $label8
        i32.const 0
        i32.const 0
        i32.load offset=1051108
        i32.const -2
        local.get $var1
        i32.const 3
        i32.shr_u
        i32.rotl
        i32.and
        i32.store offset=1051108
        return
      end $label7
      local.get $var2
      local.get $var3
      i32.store offset=24
      block $label9
        local.get $var0
        i32.load offset=16
        local.tee $var1
        i32.eqz
        br_if $label9
        local.get $var2
        local.get $var1
        i32.store offset=16
        local.get $var1
        local.get $var2
        i32.store offset=24
      end $label9
      local.get $var0
      i32.load offset=20
      local.tee $var1
      i32.eqz
      br_if $label5
      local.get $var2
      local.get $var1
      i32.store offset=20
      local.get $var1
      local.get $var2
      i32.store offset=24
      return
    end $label5
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17haf433297d8e77a90E (;18;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    local.get $var0
    local.get $var1
    i32.add
    local.set $var2
    block $label1
      block $label0
        local.get $var0
        i32.load offset=4
        local.tee $var3
        i32.const 1
        i32.and
        br_if $label0
        local.get $var3
        i32.const 2
        i32.and
        i32.eqz
        br_if $label1
        local.get $var0
        i32.load
        local.tee $var3
        local.get $var1
        i32.add
        local.set $var1
        block $label2
          local.get $var0
          local.get $var3
          i32.sub
          local.tee $var0
          i32.const 0
          i32.load offset=1051124
          i32.ne
          br_if $label2
          local.get $var2
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if $label0
          i32.const 0
          local.get $var1
          i32.store offset=1051116
          local.get $var2
          local.get $var2
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get $var0
          local.get $var1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var2
          local.get $var1
          i32.store
          br $label1
        end $label2
        local.get $var0
        local.get $var3
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hcaef18d57bcc0f93E
      end $label0
      block $label5
        block $label4
          block $label6
            block $label3
              local.get $var2
              i32.load offset=4
              local.tee $var3
              i32.const 2
              i32.and
              br_if $label3
              local.get $var2
              i32.const 0
              i32.load offset=1051128
              i32.eq
              br_if $label4
              local.get $var2
              i32.const 0
              i32.load offset=1051124
              i32.eq
              br_if $label5
              local.get $var2
              local.get $var3
              i32.const -8
              i32.and
              local.tee $var3
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hcaef18d57bcc0f93E
              local.get $var0
              local.get $var3
              local.get $var1
              i32.add
              local.tee $var1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var1
              i32.add
              local.get $var1
              i32.store
              local.get $var0
              i32.const 0
              i32.load offset=1051124
              i32.ne
              br_if $label6
              i32.const 0
              local.get $var1
              i32.store offset=1051116
              return
            end $label3
            local.get $var2
            local.get $var3
            i32.const -2
            i32.and
            i32.store offset=4
            local.get $var0
            local.get $var1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get $var0
            local.get $var1
            i32.add
            local.get $var1
            i32.store
          end $label6
          block $label7
            local.get $var1
            i32.const 256
            i32.lt_u
            br_if $label7
            local.get $var0
            local.get $var1
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hed6bdaacb86779faE
            return
          end $label7
          local.get $var1
          i32.const -8
          i32.and
          i32.const 1050844
          i32.add
          local.set $var2
          block $label9
            block $label8
              i32.const 0
              i32.load offset=1051108
              local.tee $var3
              i32.const 1
              local.get $var1
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee $var1
              i32.and
              br_if $label8
              i32.const 0
              local.get $var3
              local.get $var1
              i32.or
              i32.store offset=1051108
              local.get $var2
              local.set $var1
              br $label9
            end $label8
            local.get $var2
            i32.load offset=8
            local.set $var1
          end $label9
          local.get $var2
          local.get $var0
          i32.store offset=8
          local.get $var1
          local.get $var0
          i32.store offset=12
          local.get $var0
          local.get $var2
          i32.store offset=12
          local.get $var0
          local.get $var1
          i32.store offset=8
          return
        end $label4
        i32.const 0
        local.get $var0
        i32.store offset=1051128
        i32.const 0
        i32.const 0
        i32.load offset=1051120
        local.get $var1
        i32.add
        local.tee $var1
        i32.store offset=1051120
        local.get $var0
        local.get $var1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get $var0
        i32.const 0
        i32.load offset=1051124
        i32.ne
        br_if $label1
        i32.const 0
        i32.const 0
        i32.store offset=1051116
        i32.const 0
        i32.const 0
        i32.store offset=1051124
        return
      end $label5
      i32.const 0
      local.get $var0
      i32.store offset=1051124
      i32.const 0
      i32.const 0
      i32.load offset=1051116
      local.get $var1
      i32.add
      local.tee $var1
      i32.store offset=1051116
      local.get $var0
      local.get $var1
      i32.const 1
      i32.or
      i32.store offset=4
      local.get $var0
      local.get $var1
      i32.add
      local.get $var1
      i32.store
      return
    end $label1
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17ha99e3efb2d98b193E (;19;) (param $var0 i32) (result i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i64)
    block $label42
      block $label44
        block $label1
          block $label2
            block $label34
              block $label7
                block $label5
                  block $label0
                    local.get $var0
                    i32.const 245
                    i32.lt_u
                    br_if $label0
                    i32.const 0
                    local.set $var1
                    local.get $var0
                    i32.const -65587
                    i32.ge_u
                    br_if $label1
                    local.get $var0
                    i32.const 11
                    i32.add
                    local.tee $var0
                    i32.const -8
                    i32.and
                    local.set $var2
                    i32.const 0
                    i32.load offset=1051112
                    local.tee $var3
                    i32.eqz
                    br_if $label2
                    i32.const 0
                    local.set $var4
                    block $label3
                      local.get $var2
                      i32.const 256
                      i32.lt_u
                      br_if $label3
                      i32.const 31
                      local.set $var4
                      local.get $var2
                      i32.const 16777215
                      i32.gt_u
                      br_if $label3
                      local.get $var2
                      i32.const 6
                      local.get $var0
                      i32.const 8
                      i32.shr_u
                      i32.clz
                      local.tee $var0
                      i32.sub
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get $var0
                      i32.const 1
                      i32.shl
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set $var4
                    end $label3
                    i32.const 0
                    local.get $var2
                    i32.sub
                    local.set $var1
                    block $label4
                      local.get $var4
                      i32.const 2
                      i32.shl
                      i32.const 1050700
                      i32.add
                      i32.load
                      local.tee $var5
                      br_if $label4
                      i32.const 0
                      local.set $var0
                      i32.const 0
                      local.set $var6
                      br $label5
                    end $label4
                    i32.const 0
                    local.set $var0
                    local.get $var2
                    i32.const 0
                    i32.const 25
                    local.get $var4
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get $var4
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set $var7
                    i32.const 0
                    local.set $var6
                    loop $label8
                      block $label6
                        local.get $var5
                        local.tee $var5
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.tee $var8
                        local.get $var2
                        i32.lt_u
                        br_if $label6
                        local.get $var8
                        local.get $var2
                        i32.sub
                        local.tee $var8
                        local.get $var1
                        i32.ge_u
                        br_if $label6
                        local.get $var8
                        local.set $var1
                        local.get $var5
                        local.set $var6
                        local.get $var8
                        br_if $label6
                        i32.const 0
                        local.set $var1
                        local.get $var5
                        local.set $var6
                        local.get $var5
                        local.set $var0
                        br $label7
                      end $label6
                      local.get $var5
                      i32.load offset=20
                      local.tee $var8
                      local.get $var0
                      local.get $var8
                      local.get $var5
                      local.get $var7
                      i32.const 29
                      i32.shr_u
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      i32.load
                      local.tee $var5
                      i32.ne
                      select
                      local.get $var0
                      local.get $var8
                      select
                      local.set $var0
                      local.get $var7
                      i32.const 1
                      i32.shl
                      local.set $var7
                      local.get $var5
                      i32.eqz
                      br_if $label5
                      br $label8
                    end $label8
                  end $label0
                  block $label9
                    i32.const 0
                    i32.load offset=1051108
                    local.tee $var5
                    i32.const 16
                    local.get $var0
                    i32.const 11
                    i32.add
                    i32.const 504
                    i32.and
                    local.get $var0
                    i32.const 11
                    i32.lt_u
                    select
                    local.tee $var2
                    i32.const 3
                    i32.shr_u
                    local.tee $var1
                    i32.shr_u
                    local.tee $var0
                    i32.const 3
                    i32.and
                    i32.eqz
                    br_if $label9
                    block $label11
                      block $label10
                        local.get $var0
                        i32.const -1
                        i32.xor
                        i32.const 1
                        i32.and
                        local.get $var1
                        i32.add
                        local.tee $var2
                        i32.const 3
                        i32.shl
                        local.tee $var0
                        i32.const 1050844
                        i32.add
                        local.tee $var1
                        local.get $var0
                        i32.const 1050852
                        i32.add
                        i32.load
                        local.tee $var0
                        i32.load offset=8
                        local.tee $var6
                        i32.eq
                        br_if $label10
                        local.get $var6
                        local.get $var1
                        i32.store offset=12
                        local.get $var1
                        local.get $var6
                        i32.store offset=8
                        br $label11
                      end $label10
                      i32.const 0
                      local.get $var5
                      i32.const -2
                      local.get $var2
                      i32.rotl
                      i32.and
                      i32.store offset=1051108
                    end $label11
                    local.get $var0
                    local.get $var2
                    i32.const 3
                    i32.shl
                    local.tee $var2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $var0
                    local.get $var2
                    i32.add
                    local.tee $var2
                    local.get $var2
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get $var0
                    i32.const 8
                    i32.add
                    return
                  end $label9
                  local.get $var2
                  i32.const 0
                  i32.load offset=1051116
                  i32.le_u
                  br_if $label2
                  block $label18
                    block $label20
                      block $label12
                        local.get $var0
                        br_if $label12
                        i32.const 0
                        i32.load offset=1051112
                        local.tee $var0
                        i32.eqz
                        br_if $label2
                        local.get $var0
                        i32.ctz
                        i32.const 2
                        i32.shl
                        i32.const 1050700
                        i32.add
                        i32.load
                        local.tee $var6
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get $var2
                        i32.sub
                        local.set $var1
                        local.get $var6
                        local.set $var5
                        loop $label21
                          block $label13
                            local.get $var6
                            i32.load offset=16
                            local.tee $var0
                            br_if $label13
                            local.get $var6
                            i32.load offset=20
                            local.tee $var0
                            br_if $label13
                            local.get $var5
                            i32.load offset=24
                            local.set $var4
                            block $label16
                              block $label15
                                block $label14
                                  local.get $var5
                                  i32.load offset=12
                                  local.tee $var0
                                  local.get $var5
                                  i32.ne
                                  br_if $label14
                                  local.get $var5
                                  i32.const 20
                                  i32.const 16
                                  local.get $var5
                                  i32.load offset=20
                                  local.tee $var0
                                  select
                                  i32.add
                                  i32.load
                                  local.tee $var6
                                  br_if $label15
                                  i32.const 0
                                  local.set $var0
                                  br $label16
                                end $label14
                                local.get $var5
                                i32.load offset=8
                                local.tee $var6
                                local.get $var0
                                i32.store offset=12
                                local.get $var0
                                local.get $var6
                                i32.store offset=8
                                br $label16
                              end $label15
                              local.get $var5
                              i32.const 20
                              i32.add
                              local.get $var5
                              i32.const 16
                              i32.add
                              local.get $var0
                              select
                              local.set $var7
                              loop $label17
                                local.get $var7
                                local.set $var8
                                local.get $var6
                                local.tee $var0
                                i32.const 20
                                i32.add
                                local.get $var0
                                i32.const 16
                                i32.add
                                local.get $var0
                                i32.load offset=20
                                local.tee $var6
                                select
                                local.set $var7
                                local.get $var0
                                i32.const 20
                                i32.const 16
                                local.get $var6
                                select
                                i32.add
                                i32.load
                                local.tee $var6
                                br_if $label17
                              end $label17
                              local.get $var8
                              i32.const 0
                              i32.store
                            end $label16
                            local.get $var4
                            i32.eqz
                            br_if $label18
                            block $label19
                              local.get $var5
                              i32.load offset=28
                              i32.const 2
                              i32.shl
                              i32.const 1050700
                              i32.add
                              local.tee $var6
                              i32.load
                              local.get $var5
                              i32.eq
                              br_if $label19
                              local.get $var4
                              i32.const 16
                              i32.const 20
                              local.get $var4
                              i32.load offset=16
                              local.get $var5
                              i32.eq
                              select
                              i32.add
                              local.get $var0
                              i32.store
                              local.get $var0
                              i32.eqz
                              br_if $label18
                              br $label20
                            end $label19
                            local.get $var6
                            local.get $var0
                            i32.store
                            local.get $var0
                            br_if $label20
                            i32.const 0
                            i32.const 0
                            i32.load offset=1051112
                            i32.const -2
                            local.get $var5
                            i32.load offset=28
                            i32.rotl
                            i32.and
                            i32.store offset=1051112
                            br $label18
                          end $label13
                          local.get $var0
                          i32.load offset=4
                          i32.const -8
                          i32.and
                          local.get $var2
                          i32.sub
                          local.tee $var6
                          local.get $var1
                          local.get $var6
                          local.get $var1
                          i32.lt_u
                          local.tee $var6
                          select
                          local.set $var1
                          local.get $var0
                          local.get $var5
                          local.get $var6
                          select
                          local.set $var5
                          local.get $var0
                          local.set $var6
                          br $label21
                        end $label21
                      end $label12
                      block $label23
                        block $label22
                          local.get $var0
                          local.get $var1
                          i32.shl
                          i32.const 2
                          local.get $var1
                          i32.shl
                          local.tee $var0
                          i32.const 0
                          local.get $var0
                          i32.sub
                          i32.or
                          i32.and
                          i32.ctz
                          local.tee $var1
                          i32.const 3
                          i32.shl
                          local.tee $var0
                          i32.const 1050844
                          i32.add
                          local.tee $var6
                          local.get $var0
                          i32.const 1050852
                          i32.add
                          i32.load
                          local.tee $var0
                          i32.load offset=8
                          local.tee $var7
                          i32.eq
                          br_if $label22
                          local.get $var7
                          local.get $var6
                          i32.store offset=12
                          local.get $var6
                          local.get $var7
                          i32.store offset=8
                          br $label23
                        end $label22
                        i32.const 0
                        local.get $var5
                        i32.const -2
                        local.get $var1
                        i32.rotl
                        i32.and
                        i32.store offset=1051108
                      end $label23
                      local.get $var0
                      local.get $var2
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get $var0
                      local.get $var2
                      i32.add
                      local.tee $var7
                      local.get $var1
                      i32.const 3
                      i32.shl
                      local.tee $var6
                      local.get $var2
                      i32.sub
                      local.tee $var1
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var0
                      local.get $var6
                      i32.add
                      local.get $var1
                      i32.store
                      block $label24
                        i32.const 0
                        i32.load offset=1051116
                        local.tee $var5
                        i32.eqz
                        br_if $label24
                        local.get $var5
                        i32.const -8
                        i32.and
                        i32.const 1050844
                        i32.add
                        local.set $var6
                        i32.const 0
                        i32.load offset=1051124
                        local.set $var2
                        block $label26
                          block $label25
                            i32.const 0
                            i32.load offset=1051108
                            local.tee $var8
                            i32.const 1
                            local.get $var5
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee $var5
                            i32.and
                            br_if $label25
                            i32.const 0
                            local.get $var8
                            local.get $var5
                            i32.or
                            i32.store offset=1051108
                            local.get $var6
                            local.set $var5
                            br $label26
                          end $label25
                          local.get $var6
                          i32.load offset=8
                          local.set $var5
                        end $label26
                        local.get $var6
                        local.get $var2
                        i32.store offset=8
                        local.get $var5
                        local.get $var2
                        i32.store offset=12
                        local.get $var2
                        local.get $var6
                        i32.store offset=12
                        local.get $var2
                        local.get $var5
                        i32.store offset=8
                      end $label24
                      i32.const 0
                      local.get $var7
                      i32.store offset=1051124
                      i32.const 0
                      local.get $var1
                      i32.store offset=1051116
                      local.get $var0
                      i32.const 8
                      i32.add
                      return
                    end $label20
                    local.get $var0
                    local.get $var4
                    i32.store offset=24
                    block $label27
                      local.get $var5
                      i32.load offset=16
                      local.tee $var6
                      i32.eqz
                      br_if $label27
                      local.get $var0
                      local.get $var6
                      i32.store offset=16
                      local.get $var6
                      local.get $var0
                      i32.store offset=24
                    end $label27
                    local.get $var5
                    i32.load offset=20
                    local.tee $var6
                    i32.eqz
                    br_if $label18
                    local.get $var0
                    local.get $var6
                    i32.store offset=20
                    local.get $var6
                    local.get $var0
                    i32.store offset=24
                  end $label18
                  block $label32
                    block $label29
                      block $label28
                        local.get $var1
                        i32.const 16
                        i32.lt_u
                        br_if $label28
                        local.get $var5
                        local.get $var2
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get $var5
                        local.get $var2
                        i32.add
                        local.tee $var2
                        local.get $var1
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get $var2
                        local.get $var1
                        i32.add
                        local.get $var1
                        i32.store
                        i32.const 0
                        i32.load offset=1051116
                        local.tee $var7
                        i32.eqz
                        br_if $label29
                        local.get $var7
                        i32.const -8
                        i32.and
                        i32.const 1050844
                        i32.add
                        local.set $var6
                        i32.const 0
                        i32.load offset=1051124
                        local.set $var0
                        block $label31
                          block $label30
                            i32.const 0
                            i32.load offset=1051108
                            local.tee $var8
                            i32.const 1
                            local.get $var7
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee $var7
                            i32.and
                            br_if $label30
                            i32.const 0
                            local.get $var8
                            local.get $var7
                            i32.or
                            i32.store offset=1051108
                            local.get $var6
                            local.set $var7
                            br $label31
                          end $label30
                          local.get $var6
                          i32.load offset=8
                          local.set $var7
                        end $label31
                        local.get $var6
                        local.get $var0
                        i32.store offset=8
                        local.get $var7
                        local.get $var0
                        i32.store offset=12
                        local.get $var0
                        local.get $var6
                        i32.store offset=12
                        local.get $var0
                        local.get $var7
                        i32.store offset=8
                        br $label29
                      end $label28
                      local.get $var5
                      local.get $var1
                      local.get $var2
                      i32.add
                      local.tee $var0
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get $var5
                      local.get $var0
                      i32.add
                      local.tee $var0
                      local.get $var0
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      br $label32
                    end $label29
                    i32.const 0
                    local.get $var2
                    i32.store offset=1051124
                    i32.const 0
                    local.get $var1
                    i32.store offset=1051116
                  end $label32
                  local.get $var5
                  i32.const 8
                  i32.add
                  return
                end $label5
                block $label33
                  local.get $var0
                  local.get $var6
                  i32.or
                  br_if $label33
                  i32.const 0
                  local.set $var6
                  i32.const 2
                  local.get $var4
                  i32.shl
                  local.tee $var0
                  i32.const 0
                  local.get $var0
                  i32.sub
                  i32.or
                  local.get $var3
                  i32.and
                  local.tee $var0
                  i32.eqz
                  br_if $label2
                  local.get $var0
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.const 1050700
                  i32.add
                  i32.load
                  local.set $var0
                end $label33
                local.get $var0
                i32.eqz
                br_if $label34
              end $label7
              loop $label36
                local.get $var0
                local.get $var6
                local.get $var0
                i32.load offset=4
                i32.const -8
                i32.and
                local.tee $var5
                local.get $var2
                i32.sub
                local.tee $var8
                local.get $var1
                i32.lt_u
                local.tee $var4
                select
                local.set $var3
                local.get $var5
                local.get $var2
                i32.lt_u
                local.set $var7
                local.get $var8
                local.get $var1
                local.get $var4
                select
                local.set $var8
                block $label35
                  local.get $var0
                  i32.load offset=16
                  local.tee $var5
                  br_if $label35
                  local.get $var0
                  i32.load offset=20
                  local.set $var5
                end $label35
                local.get $var6
                local.get $var3
                local.get $var7
                select
                local.set $var6
                local.get $var1
                local.get $var8
                local.get $var7
                select
                local.set $var1
                local.get $var5
                local.set $var0
                local.get $var5
                br_if $label36
              end $label36
            end $label34
            local.get $var6
            i32.eqz
            br_if $label2
            block $label37
              i32.const 0
              i32.load offset=1051116
              local.tee $var0
              local.get $var2
              i32.lt_u
              br_if $label37
              local.get $var1
              local.get $var0
              local.get $var2
              i32.sub
              i32.ge_u
              br_if $label2
            end $label37
            local.get $var6
            i32.load offset=24
            local.set $var4
            block $label40
              block $label39
                block $label38
                  local.get $var6
                  i32.load offset=12
                  local.tee $var0
                  local.get $var6
                  i32.ne
                  br_if $label38
                  local.get $var6
                  i32.const 20
                  i32.const 16
                  local.get $var6
                  i32.load offset=20
                  local.tee $var0
                  select
                  i32.add
                  i32.load
                  local.tee $var5
                  br_if $label39
                  i32.const 0
                  local.set $var0
                  br $label40
                end $label38
                local.get $var6
                i32.load offset=8
                local.tee $var5
                local.get $var0
                i32.store offset=12
                local.get $var0
                local.get $var5
                i32.store offset=8
                br $label40
              end $label39
              local.get $var6
              i32.const 20
              i32.add
              local.get $var6
              i32.const 16
              i32.add
              local.get $var0
              select
              local.set $var7
              loop $label41
                local.get $var7
                local.set $var8
                local.get $var5
                local.tee $var0
                i32.const 20
                i32.add
                local.get $var0
                i32.const 16
                i32.add
                local.get $var0
                i32.load offset=20
                local.tee $var5
                select
                local.set $var7
                local.get $var0
                i32.const 20
                i32.const 16
                local.get $var5
                select
                i32.add
                i32.load
                local.tee $var5
                br_if $label41
              end $label41
              local.get $var8
              i32.const 0
              i32.store
            end $label40
            local.get $var4
            i32.eqz
            br_if $label42
            block $label43
              local.get $var6
              i32.load offset=28
              i32.const 2
              i32.shl
              i32.const 1050700
              i32.add
              local.tee $var5
              i32.load
              local.get $var6
              i32.eq
              br_if $label43
              local.get $var4
              i32.const 16
              i32.const 20
              local.get $var4
              i32.load offset=16
              local.get $var6
              i32.eq
              select
              i32.add
              local.get $var0
              i32.store
              local.get $var0
              i32.eqz
              br_if $label42
              br $label44
            end $label43
            local.get $var5
            local.get $var0
            i32.store
            local.get $var0
            br_if $label44
            i32.const 0
            i32.const 0
            i32.load offset=1051112
            i32.const -2
            local.get $var6
            i32.load offset=28
            i32.rotl
            i32.and
            i32.store offset=1051112
            br $label42
          end $label2
          block $label53
            block $label70
              block $label67
                block $label66
                  block $label54
                    block $label45
                      i32.const 0
                      i32.load offset=1051116
                      local.tee $var0
                      local.get $var2
                      i32.ge_u
                      br_if $label45
                      block $label46
                        i32.const 0
                        i32.load offset=1051120
                        local.tee $var0
                        local.get $var2
                        i32.gt_u
                        br_if $label46
                        i32.const 0
                        local.set $var1
                        local.get $var2
                        i32.const 65583
                        i32.add
                        local.tee $var6
                        i32.const 16
                        i32.shr_u
                        memory.grow
                        local.tee $var0
                        i32.const -1
                        i32.eq
                        local.tee $var7
                        br_if $label1
                        local.get $var0
                        i32.const 16
                        i32.shl
                        local.tee $var5
                        i32.eqz
                        br_if $label1
                        i32.const 0
                        i32.const 0
                        i32.load offset=1051132
                        i32.const 0
                        local.get $var6
                        i32.const -65536
                        i32.and
                        local.get $var7
                        select
                        local.tee $var8
                        i32.add
                        local.tee $var0
                        i32.store offset=1051132
                        i32.const 0
                        i32.const 0
                        i32.load offset=1051136
                        local.tee $var1
                        local.get $var0
                        local.get $var1
                        local.get $var0
                        i32.gt_u
                        select
                        i32.store offset=1051136
                        block $label50
                          block $label48
                            block $label47
                              i32.const 0
                              i32.load offset=1051128
                              local.tee $var1
                              i32.eqz
                              br_if $label47
                              i32.const 1050828
                              local.set $var0
                              loop $label49
                                local.get $var0
                                i32.load
                                local.tee $var6
                                local.get $var0
                                i32.load offset=4
                                local.tee $var7
                                i32.add
                                local.get $var5
                                i32.eq
                                br_if $label48
                                local.get $var0
                                i32.load offset=8
                                local.tee $var0
                                br_if $label49
                                br $label50
                              end $label49
                            end $label47
                            block $label52
                              block $label51
                                i32.const 0
                                i32.load offset=1051144
                                local.tee $var0
                                i32.eqz
                                br_if $label51
                                local.get $var0
                                local.get $var5
                                i32.le_u
                                br_if $label52
                              end $label51
                              i32.const 0
                              local.get $var5
                              i32.store offset=1051144
                            end $label52
                            i32.const 0
                            i32.const 4095
                            i32.store offset=1051148
                            i32.const 0
                            local.get $var8
                            i32.store offset=1050832
                            i32.const 0
                            local.get $var5
                            i32.store offset=1050828
                            i32.const 0
                            i32.const 1050844
                            i32.store offset=1050856
                            i32.const 0
                            i32.const 1050852
                            i32.store offset=1050864
                            i32.const 0
                            i32.const 1050844
                            i32.store offset=1050852
                            i32.const 0
                            i32.const 1050860
                            i32.store offset=1050872
                            i32.const 0
                            i32.const 1050852
                            i32.store offset=1050860
                            i32.const 0
                            i32.const 1050868
                            i32.store offset=1050880
                            i32.const 0
                            i32.const 1050860
                            i32.store offset=1050868
                            i32.const 0
                            i32.const 1050876
                            i32.store offset=1050888
                            i32.const 0
                            i32.const 1050868
                            i32.store offset=1050876
                            i32.const 0
                            i32.const 1050884
                            i32.store offset=1050896
                            i32.const 0
                            i32.const 1050876
                            i32.store offset=1050884
                            i32.const 0
                            i32.const 1050892
                            i32.store offset=1050904
                            i32.const 0
                            i32.const 1050884
                            i32.store offset=1050892
                            i32.const 0
                            i32.const 1050900
                            i32.store offset=1050912
                            i32.const 0
                            i32.const 1050892
                            i32.store offset=1050900
                            i32.const 0
                            i32.const 0
                            i32.store offset=1050840
                            i32.const 0
                            i32.const 1050908
                            i32.store offset=1050920
                            i32.const 0
                            i32.const 1050900
                            i32.store offset=1050908
                            i32.const 0
                            i32.const 1050908
                            i32.store offset=1050916
                            i32.const 0
                            i32.const 1050916
                            i32.store offset=1050928
                            i32.const 0
                            i32.const 1050916
                            i32.store offset=1050924
                            i32.const 0
                            i32.const 1050924
                            i32.store offset=1050936
                            i32.const 0
                            i32.const 1050924
                            i32.store offset=1050932
                            i32.const 0
                            i32.const 1050932
                            i32.store offset=1050944
                            i32.const 0
                            i32.const 1050932
                            i32.store offset=1050940
                            i32.const 0
                            i32.const 1050940
                            i32.store offset=1050952
                            i32.const 0
                            i32.const 1050940
                            i32.store offset=1050948
                            i32.const 0
                            i32.const 1050948
                            i32.store offset=1050960
                            i32.const 0
                            i32.const 1050948
                            i32.store offset=1050956
                            i32.const 0
                            i32.const 1050956
                            i32.store offset=1050968
                            i32.const 0
                            i32.const 1050956
                            i32.store offset=1050964
                            i32.const 0
                            i32.const 1050964
                            i32.store offset=1050976
                            i32.const 0
                            i32.const 1050964
                            i32.store offset=1050972
                            i32.const 0
                            i32.const 1050972
                            i32.store offset=1050984
                            i32.const 0
                            i32.const 1050980
                            i32.store offset=1050992
                            i32.const 0
                            i32.const 1050972
                            i32.store offset=1050980
                            i32.const 0
                            i32.const 1050988
                            i32.store offset=1051000
                            i32.const 0
                            i32.const 1050980
                            i32.store offset=1050988
                            i32.const 0
                            i32.const 1050996
                            i32.store offset=1051008
                            i32.const 0
                            i32.const 1050988
                            i32.store offset=1050996
                            i32.const 0
                            i32.const 1051004
                            i32.store offset=1051016
                            i32.const 0
                            i32.const 1050996
                            i32.store offset=1051004
                            i32.const 0
                            i32.const 1051012
                            i32.store offset=1051024
                            i32.const 0
                            i32.const 1051004
                            i32.store offset=1051012
                            i32.const 0
                            i32.const 1051020
                            i32.store offset=1051032
                            i32.const 0
                            i32.const 1051012
                            i32.store offset=1051020
                            i32.const 0
                            i32.const 1051028
                            i32.store offset=1051040
                            i32.const 0
                            i32.const 1051020
                            i32.store offset=1051028
                            i32.const 0
                            i32.const 1051036
                            i32.store offset=1051048
                            i32.const 0
                            i32.const 1051028
                            i32.store offset=1051036
                            i32.const 0
                            i32.const 1051044
                            i32.store offset=1051056
                            i32.const 0
                            i32.const 1051036
                            i32.store offset=1051044
                            i32.const 0
                            i32.const 1051052
                            i32.store offset=1051064
                            i32.const 0
                            i32.const 1051044
                            i32.store offset=1051052
                            i32.const 0
                            i32.const 1051060
                            i32.store offset=1051072
                            i32.const 0
                            i32.const 1051052
                            i32.store offset=1051060
                            i32.const 0
                            i32.const 1051068
                            i32.store offset=1051080
                            i32.const 0
                            i32.const 1051060
                            i32.store offset=1051068
                            i32.const 0
                            i32.const 1051076
                            i32.store offset=1051088
                            i32.const 0
                            i32.const 1051068
                            i32.store offset=1051076
                            i32.const 0
                            i32.const 1051084
                            i32.store offset=1051096
                            i32.const 0
                            i32.const 1051076
                            i32.store offset=1051084
                            i32.const 0
                            i32.const 1051092
                            i32.store offset=1051104
                            i32.const 0
                            i32.const 1051084
                            i32.store offset=1051092
                            i32.const 0
                            local.get $var5
                            i32.store offset=1051128
                            i32.const 0
                            i32.const 1051092
                            i32.store offset=1051100
                            i32.const 0
                            local.get $var8
                            i32.const -40
                            i32.add
                            local.tee $var0
                            i32.store offset=1051120
                            local.get $var5
                            local.get $var0
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get $var5
                            local.get $var0
                            i32.add
                            i32.const 40
                            i32.store offset=4
                            i32.const 0
                            i32.const 2097152
                            i32.store offset=1051140
                            br $label53
                          end $label48
                          local.get $var1
                          local.get $var5
                          i32.ge_u
                          br_if $label50
                          local.get $var6
                          local.get $var1
                          i32.gt_u
                          br_if $label50
                          local.get $var0
                          i32.load offset=12
                          i32.eqz
                          br_if $label54
                        end $label50
                        i32.const 0
                        i32.const 0
                        i32.load offset=1051144
                        local.tee $var0
                        local.get $var5
                        local.get $var0
                        local.get $var5
                        i32.lt_u
                        select
                        i32.store offset=1051144
                        local.get $var5
                        local.get $var8
                        i32.add
                        local.set $var6
                        i32.const 1050828
                        local.set $var0
                        block $label58
                          block $label57
                            block $label55
                              loop $label56
                                local.get $var0
                                i32.load
                                local.get $var6
                                i32.eq
                                br_if $label55
                                local.get $var0
                                i32.load offset=8
                                local.tee $var0
                                br_if $label56
                                br $label57
                              end $label56
                            end $label55
                            local.get $var0
                            i32.load offset=12
                            i32.eqz
                            br_if $label58
                          end $label57
                          i32.const 1050828
                          local.set $var0
                          block $label60
                            loop $label61
                              block $label59
                                local.get $var0
                                i32.load
                                local.tee $var6
                                local.get $var1
                                i32.gt_u
                                br_if $label59
                                local.get $var1
                                local.get $var6
                                local.get $var0
                                i32.load offset=4
                                i32.add
                                local.tee $var6
                                i32.lt_u
                                br_if $label60
                              end $label59
                              local.get $var0
                              i32.load offset=8
                              local.set $var0
                              br $label61
                            end $label61
                          end $label60
                          i32.const 0
                          local.get $var5
                          i32.store offset=1051128
                          i32.const 0
                          local.get $var8
                          i32.const -40
                          i32.add
                          local.tee $var0
                          i32.store offset=1051120
                          local.get $var5
                          local.get $var0
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get $var5
                          local.get $var0
                          i32.add
                          i32.const 40
                          i32.store offset=4
                          i32.const 0
                          i32.const 2097152
                          i32.store offset=1051140
                          local.get $var1
                          local.get $var6
                          i32.const -32
                          i32.add
                          i32.const -8
                          i32.and
                          i32.const -8
                          i32.add
                          local.tee $var0
                          local.get $var0
                          local.get $var1
                          i32.const 16
                          i32.add
                          i32.lt_u
                          select
                          local.tee $var7
                          i32.const 27
                          i32.store offset=4
                          i32.const 0
                          i64.load offset=1050828 align=4
                          local.set $var9
                          local.get $var7
                          i32.const 16
                          i32.add
                          i32.const 0
                          i64.load offset=1050836 align=4
                          i64.store align=4
                          local.get $var7
                          local.get $var9
                          i64.store offset=8 align=4
                          i32.const 0
                          local.get $var8
                          i32.store offset=1050832
                          i32.const 0
                          local.get $var5
                          i32.store offset=1050828
                          i32.const 0
                          local.get $var7
                          i32.const 8
                          i32.add
                          i32.store offset=1050836
                          i32.const 0
                          i32.const 0
                          i32.store offset=1050840
                          local.get $var7
                          i32.const 28
                          i32.add
                          local.set $var0
                          loop $label62
                            local.get $var0
                            i32.const 7
                            i32.store
                            local.get $var0
                            i32.const 4
                            i32.add
                            local.tee $var0
                            local.get $var6
                            i32.lt_u
                            br_if $label62
                          end $label62
                          local.get $var7
                          local.get $var1
                          i32.eq
                          br_if $label53
                          local.get $var7
                          local.get $var7
                          i32.load offset=4
                          i32.const -2
                          i32.and
                          i32.store offset=4
                          local.get $var1
                          local.get $var7
                          local.get $var1
                          i32.sub
                          local.tee $var0
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get $var7
                          local.get $var0
                          i32.store
                          block $label63
                            local.get $var0
                            i32.const 256
                            i32.lt_u
                            br_if $label63
                            local.get $var1
                            local.get $var0
                            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hed6bdaacb86779faE
                            br $label53
                          end $label63
                          local.get $var0
                          i32.const -8
                          i32.and
                          i32.const 1050844
                          i32.add
                          local.set $var6
                          block $label65
                            block $label64
                              i32.const 0
                              i32.load offset=1051108
                              local.tee $var5
                              i32.const 1
                              local.get $var0
                              i32.const 3
                              i32.shr_u
                              i32.shl
                              local.tee $var0
                              i32.and
                              br_if $label64
                              i32.const 0
                              local.get $var5
                              local.get $var0
                              i32.or
                              i32.store offset=1051108
                              local.get $var6
                              local.set $var0
                              br $label65
                            end $label64
                            local.get $var6
                            i32.load offset=8
                            local.set $var0
                          end $label65
                          local.get $var6
                          local.get $var1
                          i32.store offset=8
                          local.get $var0
                          local.get $var1
                          i32.store offset=12
                          local.get $var1
                          local.get $var6
                          i32.store offset=12
                          local.get $var1
                          local.get $var0
                          i32.store offset=8
                          br $label53
                        end $label58
                        local.get $var0
                        local.get $var5
                        i32.store
                        local.get $var0
                        local.get $var0
                        i32.load offset=4
                        local.get $var8
                        i32.add
                        i32.store offset=4
                        local.get $var5
                        local.get $var2
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get $var6
                        local.get $var5
                        local.get $var2
                        i32.add
                        local.tee $var0
                        i32.sub
                        local.set $var2
                        local.get $var6
                        i32.const 0
                        i32.load offset=1051128
                        i32.eq
                        br_if $label66
                        local.get $var6
                        i32.const 0
                        i32.load offset=1051124
                        i32.eq
                        br_if $label67
                        block $label68
                          local.get $var6
                          i32.load offset=4
                          local.tee $var1
                          i32.const 3
                          i32.and
                          i32.const 1
                          i32.ne
                          br_if $label68
                          local.get $var6
                          local.get $var1
                          i32.const -8
                          i32.and
                          local.tee $var1
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hcaef18d57bcc0f93E
                          local.get $var1
                          local.get $var2
                          i32.add
                          local.set $var2
                          local.get $var6
                          local.get $var1
                          i32.add
                          local.tee $var6
                          i32.load offset=4
                          local.set $var1
                        end $label68
                        local.get $var6
                        local.get $var1
                        i32.const -2
                        i32.and
                        i32.store offset=4
                        local.get $var0
                        local.get $var2
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get $var0
                        local.get $var2
                        i32.add
                        local.get $var2
                        i32.store
                        block $label69
                          local.get $var2
                          i32.const 256
                          i32.lt_u
                          br_if $label69
                          local.get $var0
                          local.get $var2
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hed6bdaacb86779faE
                          br $label70
                        end $label69
                        local.get $var2
                        i32.const -8
                        i32.and
                        i32.const 1050844
                        i32.add
                        local.set $var1
                        block $label72
                          block $label71
                            i32.const 0
                            i32.load offset=1051108
                            local.tee $var6
                            i32.const 1
                            local.get $var2
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee $var2
                            i32.and
                            br_if $label71
                            i32.const 0
                            local.get $var6
                            local.get $var2
                            i32.or
                            i32.store offset=1051108
                            local.get $var1
                            local.set $var2
                            br $label72
                          end $label71
                          local.get $var1
                          i32.load offset=8
                          local.set $var2
                        end $label72
                        local.get $var1
                        local.get $var0
                        i32.store offset=8
                        local.get $var2
                        local.get $var0
                        i32.store offset=12
                        local.get $var0
                        local.get $var1
                        i32.store offset=12
                        local.get $var0
                        local.get $var2
                        i32.store offset=8
                        br $label70
                      end $label46
                      i32.const 0
                      local.get $var0
                      local.get $var2
                      i32.sub
                      local.tee $var1
                      i32.store offset=1051120
                      i32.const 0
                      i32.const 0
                      i32.load offset=1051128
                      local.tee $var0
                      local.get $var2
                      i32.add
                      local.tee $var6
                      i32.store offset=1051128
                      local.get $var6
                      local.get $var1
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var0
                      local.get $var2
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get $var0
                      i32.const 8
                      i32.add
                      local.set $var1
                      br $label1
                    end $label45
                    i32.const 0
                    i32.load offset=1051124
                    local.set $var1
                    block $label74
                      block $label73
                        local.get $var0
                        local.get $var2
                        i32.sub
                        local.tee $var6
                        i32.const 15
                        i32.gt_u
                        br_if $label73
                        i32.const 0
                        i32.const 0
                        i32.store offset=1051124
                        i32.const 0
                        i32.const 0
                        i32.store offset=1051116
                        local.get $var1
                        local.get $var0
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get $var1
                        local.get $var0
                        i32.add
                        local.tee $var0
                        local.get $var0
                        i32.load offset=4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br $label74
                      end $label73
                      i32.const 0
                      local.get $var6
                      i32.store offset=1051116
                      i32.const 0
                      local.get $var1
                      local.get $var2
                      i32.add
                      local.tee $var5
                      i32.store offset=1051124
                      local.get $var5
                      local.get $var6
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var1
                      local.get $var0
                      i32.add
                      local.get $var6
                      i32.store
                      local.get $var1
                      local.get $var2
                      i32.const 3
                      i32.or
                      i32.store offset=4
                    end $label74
                    local.get $var1
                    i32.const 8
                    i32.add
                    return
                  end $label54
                  local.get $var0
                  local.get $var7
                  local.get $var8
                  i32.add
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051128
                  local.tee $var0
                  i32.const 15
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee $var1
                  i32.const -8
                  i32.add
                  local.tee $var6
                  i32.store offset=1051128
                  i32.const 0
                  local.get $var0
                  local.get $var1
                  i32.sub
                  i32.const 0
                  i32.load offset=1051120
                  local.get $var8
                  i32.add
                  local.tee $var1
                  i32.add
                  i32.const 8
                  i32.add
                  local.tee $var5
                  i32.store offset=1051120
                  local.get $var6
                  local.get $var5
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var0
                  local.get $var1
                  i32.add
                  i32.const 40
                  i32.store offset=4
                  i32.const 0
                  i32.const 2097152
                  i32.store offset=1051140
                  br $label53
                end $label66
                i32.const 0
                local.get $var0
                i32.store offset=1051128
                i32.const 0
                i32.const 0
                i32.load offset=1051120
                local.get $var2
                i32.add
                local.tee $var2
                i32.store offset=1051120
                local.get $var0
                local.get $var2
                i32.const 1
                i32.or
                i32.store offset=4
                br $label70
              end $label67
              i32.const 0
              local.get $var0
              i32.store offset=1051124
              i32.const 0
              i32.const 0
              i32.load offset=1051116
              local.get $var2
              i32.add
              local.tee $var2
              i32.store offset=1051116
              local.get $var0
              local.get $var2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var2
              i32.add
              local.get $var2
              i32.store
            end $label70
            local.get $var5
            i32.const 8
            i32.add
            return
          end $label53
          i32.const 0
          local.set $var1
          i32.const 0
          i32.load offset=1051120
          local.tee $var0
          local.get $var2
          i32.le_u
          br_if $label1
          i32.const 0
          local.get $var0
          local.get $var2
          i32.sub
          local.tee $var1
          i32.store offset=1051120
          i32.const 0
          i32.const 0
          i32.load offset=1051128
          local.tee $var0
          local.get $var2
          i32.add
          local.tee $var6
          i32.store offset=1051128
          local.get $var6
          local.get $var1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var0
          local.get $var2
          i32.const 3
          i32.or
          i32.store offset=4
          local.get $var0
          i32.const 8
          i32.add
          return
        end $label1
        local.get $var1
        return
      end $label44
      local.get $var0
      local.get $var4
      i32.store offset=24
      block $label75
        local.get $var6
        i32.load offset=16
        local.tee $var5
        i32.eqz
        br_if $label75
        local.get $var0
        local.get $var5
        i32.store offset=16
        local.get $var5
        local.get $var0
        i32.store offset=24
      end $label75
      local.get $var6
      i32.load offset=20
      local.tee $var5
      i32.eqz
      br_if $label42
      local.get $var0
      local.get $var5
      i32.store offset=20
      local.get $var5
      local.get $var0
      i32.store offset=24
    end $label42
    block $label78
      block $label76
        local.get $var1
        i32.const 16
        i32.lt_u
        br_if $label76
        local.get $var6
        local.get $var2
        i32.const 3
        i32.or
        i32.store offset=4
        local.get $var6
        local.get $var2
        i32.add
        local.tee $var0
        local.get $var1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get $var0
        local.get $var1
        i32.add
        local.get $var1
        i32.store
        block $label77
          local.get $var1
          i32.const 256
          i32.lt_u
          br_if $label77
          local.get $var0
          local.get $var1
          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hed6bdaacb86779faE
          br $label78
        end $label77
        local.get $var1
        i32.const -8
        i32.and
        i32.const 1050844
        i32.add
        local.set $var2
        block $label80
          block $label79
            i32.const 0
            i32.load offset=1051108
            local.tee $var5
            i32.const 1
            local.get $var1
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee $var1
            i32.and
            br_if $label79
            i32.const 0
            local.get $var5
            local.get $var1
            i32.or
            i32.store offset=1051108
            local.get $var2
            local.set $var1
            br $label80
          end $label79
          local.get $var2
          i32.load offset=8
          local.set $var1
        end $label80
        local.get $var2
        local.get $var0
        i32.store offset=8
        local.get $var1
        local.get $var0
        i32.store offset=12
        local.get $var0
        local.get $var2
        i32.store offset=12
        local.get $var0
        local.get $var1
        i32.store offset=8
        br $label78
      end $label76
      local.get $var6
      local.get $var1
      local.get $var2
      i32.add
      local.tee $var0
      i32.const 3
      i32.or
      i32.store offset=4
      local.get $var6
      local.get $var0
      i32.add
      local.tee $var0
      local.get $var0
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
    end $label78
    local.get $var6
    i32.const 8
    i32.add
  )
  (func $_ZN5alloc7raw_vec12handle_error17h76131d670f53a5eeE (;20;) (param $var0 i32) (param $var1 i32)
    block $label0
      local.get $var0
      br_if $label0
      call $_ZN5alloc7raw_vec17capacity_overflow17h76f9308d7d8b5961E
      unreachable
    end $label0
    unreachable
    unreachable
  )
  (func $_ZN5alloc7raw_vec17capacity_overflow17h76f9308d7d8b5961E (;21;)
    (local $var0 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var0
    global.set $__stack_pointer
    local.get $var0
    i32.const 0
    i32.store offset=24
    local.get $var0
    i32.const 1
    i32.store offset=12
    local.get $var0
    i32.const 1048596
    i32.store offset=8
    local.get $var0
    i64.const 4
    i64.store offset=16 align=4
    local.get $var0
    i32.const 8
    i32.add
    i32.const 1048632
    call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
    unreachable
  )
  (func $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E (;22;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    local.get $var2
    i32.const 16
    i32.add
    local.get $var0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get $var2
    i32.const 8
    i32.add
    local.get $var0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get $var2
    i32.const 1
    i32.store16 offset=28
    local.get $var2
    local.get $var1
    i32.store offset=24
    local.get $var2
    local.get $var0
    i64.load align=4
    i64.store
    local.get $var2
    call $rust_begin_unwind
    unreachable
  )
  (func $rust_begin_unwind (;23;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var0
    i32.load offset=24
    local.set $var2
    local.get $var1
    i32.const 16
    i32.add
    local.get $var0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get $var1
    i32.const 8
    i32.add
    local.get $var0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get $var1
    local.get $var0
    i32.store offset=28
    local.get $var1
    local.get $var2
    i32.store offset=24
    local.get $var1
    local.get $var0
    i64.load align=4
    i64.store
    local.get $var1
    call $_ZN3std3sys9backtrace26__rust_end_short_backtrace17h2bcfc60c3cf0a312E
    unreachable
  )
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hd46d69ca3fa9eb1eE (;24;) (param $var0 i32) (param $var1 i32) (result i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i64)
    (local $var5 i64)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    (local $var14 i32)
    (local $var15 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    i32.const 39
    local.set $var3
    block $label1
      block $label0
        local.get $var0
        i64.load32_u
        local.tee $var4
        i64.const 10000
        i64.ge_u
        br_if $label0
        local.get $var4
        local.set $var5
        br $label1
      end $label0
      i32.const 39
      local.set $var3
      loop $label2
        local.get $var2
        i32.const 9
        i32.add
        local.get $var3
        i32.add
        local.tee $var0
        i32.const -4
        i32.add
        local.get $var4
        i64.const 10000
        i64.div_u
        local.tee $var5
        i64.const 55536
        i64.mul
        local.get $var4
        i64.add
        i32.wrap_i64
        local.tee $var6
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee $var7
        i32.const 1
        i32.shl
        i32.const 1048908
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get $var0
        i32.const -2
        i32.add
        local.get $var7
        i32.const -100
        i32.mul
        local.get $var6
        i32.add
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1048908
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get $var3
        i32.const -4
        i32.add
        local.set $var3
        local.get $var4
        i64.const 99999999
        i64.gt_u
        local.set $var0
        local.get $var5
        local.set $var4
        local.get $var0
        br_if $label2
      end $label2
    end $label1
    block $label3
      local.get $var5
      i32.wrap_i64
      local.tee $var0
      i32.const 99
      i32.le_u
      br_if $label3
      local.get $var2
      i32.const 9
      i32.add
      local.get $var3
      i32.const -2
      i32.add
      local.tee $var3
      i32.add
      local.get $var5
      i32.wrap_i64
      local.tee $var6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee $var0
      i32.const -100
      i32.mul
      local.get $var6
      i32.add
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1048908
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end $label3
    block $label5
      block $label4
        local.get $var0
        i32.const 10
        i32.lt_u
        br_if $label4
        local.get $var2
        i32.const 9
        i32.add
        local.get $var3
        i32.const -2
        i32.add
        local.tee $var3
        i32.add
        local.get $var0
        i32.const 1
        i32.shl
        i32.const 1048908
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br $label5
      end $label4
      local.get $var2
      i32.const 9
      i32.add
      local.get $var3
      i32.const -1
      i32.add
      local.tee $var3
      i32.add
      local.get $var0
      i32.const 48
      i32.or
      i32.store8
    end $label5
    i32.const 39
    local.get $var3
    i32.sub
    local.set $var8
    i32.const 1
    local.set $var7
    i32.const 43
    i32.const 1114112
    local.get $var1
    i32.load offset=28
    local.tee $var0
    i32.const 1
    i32.and
    local.tee $var6
    select
    local.set $var9
    local.get $var0
    i32.const 4
    i32.and
    i32.const 2
    i32.shr_u
    local.set $var10
    local.get $var2
    i32.const 9
    i32.add
    local.get $var3
    i32.add
    local.set $var11
    block $label7
      block $label6
        local.get $var1
        i32.load
        br_if $label6
        local.get $var1
        i32.load offset=20
        local.tee $var3
        local.get $var1
        i32.load offset=24
        local.tee $var0
        local.get $var9
        local.get $var10
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17hd0d96a1c692dec19E
        br_if $label7
        local.get $var3
        local.get $var11
        local.get $var8
        local.get $var0
        i32.load offset=12
        call_indirect (param i32 i32 i32) (result i32)
        local.set $var7
        br $label7
      end $label6
      block $label8
        local.get $var1
        i32.load offset=4
        local.tee $var12
        local.get $var6
        local.get $var8
        i32.add
        local.tee $var7
        i32.gt_u
        br_if $label8
        i32.const 1
        local.set $var7
        local.get $var1
        i32.load offset=20
        local.tee $var3
        local.get $var1
        i32.load offset=24
        local.tee $var0
        local.get $var9
        local.get $var10
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17hd0d96a1c692dec19E
        br_if $label7
        local.get $var3
        local.get $var11
        local.get $var8
        local.get $var0
        i32.load offset=12
        call_indirect (param i32 i32 i32) (result i32)
        local.set $var7
        br $label7
      end $label8
      block $label9
        local.get $var0
        i32.const 8
        i32.and
        i32.eqz
        br_if $label9
        local.get $var1
        i32.load offset=16
        local.set $var13
        local.get $var1
        i32.const 48
        i32.store offset=16
        local.get $var1
        i32.load8_u offset=32
        local.set $var14
        i32.const 1
        local.set $var7
        local.get $var1
        i32.const 1
        i32.store8 offset=32
        local.get $var1
        i32.load offset=20
        local.tee $var0
        local.get $var1
        i32.load offset=24
        local.tee $var15
        local.get $var9
        local.get $var10
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17hd0d96a1c692dec19E
        br_if $label7
        local.get $var3
        local.get $var12
        i32.add
        local.get $var6
        i32.sub
        i32.const -38
        i32.add
        local.set $var3
        block $label10
          loop $label11
            local.get $var3
            i32.const -1
            i32.add
            local.tee $var3
            i32.eqz
            br_if $label10
            local.get $var0
            i32.const 48
            local.get $var15
            i32.load offset=16
            call_indirect (param i32 i32) (result i32)
            i32.eqz
            br_if $label11
            br $label7
          end $label11
        end $label10
        local.get $var0
        local.get $var11
        local.get $var8
        local.get $var15
        i32.load offset=12
        call_indirect (param i32 i32 i32) (result i32)
        br_if $label7
        local.get $var1
        local.get $var14
        i32.store8 offset=32
        local.get $var1
        local.get $var13
        i32.store offset=16
        i32.const 0
        local.set $var7
        br $label7
      end $label9
      local.get $var12
      local.get $var7
      i32.sub
      local.set $var12
      block $label12
        block $label14
          block $label13
            local.get $var1
            i32.load8_u offset=32
            local.tee $var3
            br_table $label12 $label13 $label14 $label13 $label12
          end $label13
          local.get $var12
          local.set $var3
          i32.const 0
          local.set $var12
          br $label12
        end $label14
        local.get $var12
        i32.const 1
        i32.shr_u
        local.set $var3
        local.get $var12
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set $var12
      end $label12
      local.get $var3
      i32.const 1
      i32.add
      local.set $var3
      local.get $var1
      i32.load offset=16
      local.set $var15
      local.get $var1
      i32.load offset=24
      local.set $var0
      local.get $var1
      i32.load offset=20
      local.set $var6
      block $label15
        loop $label16
          local.get $var3
          i32.const -1
          i32.add
          local.tee $var3
          i32.eqz
          br_if $label15
          local.get $var6
          local.get $var15
          local.get $var0
          i32.load offset=16
          call_indirect (param i32 i32) (result i32)
          i32.eqz
          br_if $label16
        end $label16
        i32.const 1
        local.set $var7
        br $label7
      end $label15
      i32.const 1
      local.set $var7
      local.get $var6
      local.get $var0
      local.get $var9
      local.get $var10
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17hd0d96a1c692dec19E
      br_if $label7
      local.get $var6
      local.get $var11
      local.get $var8
      local.get $var0
      i32.load offset=12
      call_indirect (param i32 i32 i32) (result i32)
      br_if $label7
      i32.const 0
      local.set $var3
      loop $label18
        block $label17
          local.get $var12
          local.get $var3
          i32.ne
          br_if $label17
          local.get $var12
          local.get $var12
          i32.lt_u
          local.set $var7
          br $label7
        end $label17
        local.get $var3
        i32.const 1
        i32.add
        local.set $var3
        local.get $var6
        local.get $var15
        local.get $var0
        i32.load offset=16
        call_indirect (param i32 i32) (result i32)
        i32.eqz
        br_if $label18
      end $label18
      local.get $var3
      i32.const -1
      i32.add
      local.get $var12
      i32.lt_u
      local.set $var7
    end $label7
    local.get $var2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get $var7
  )
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17hd0d96a1c692dec19E (;25;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32) (result i32)
    (local $var4 i32)
    block $label2
      block $label1
        block $label0
          local.get $var2
          i32.const 1114112
          i32.eq
          br_if $label0
          i32.const 1
          local.set $var4
          local.get $var0
          local.get $var2
          local.get $var1
          i32.load offset=16
          call_indirect (param i32 i32) (result i32)
          br_if $label1
        end $label0
        local.get $var3
        br_if $label2
        i32.const 0
        local.set $var4
      end $label1
      local.get $var4
      return
    end $label2
    local.get $var0
    local.get $var3
    i32.const 0
    local.get $var1
    i32.load offset=12
    call_indirect (param i32 i32 i32) (result i32)
  )
  (func $_ZN4core3fmt9Formatter3pad17hdad3e25ba05328b0E (;26;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    block $label20
      block $label24
        block $label0
          local.get $var0
          i32.load
          local.tee $var3
          local.get $var0
          i32.load offset=8
          local.tee $var4
          i32.or
          i32.eqz
          br_if $label0
          block $label1
            local.get $var4
            i32.eqz
            br_if $label1
            local.get $var1
            local.get $var2
            i32.add
            local.set $var5
            block $label3
              block $label2
                local.get $var0
                i32.load offset=12
                local.tee $var6
                br_if $label2
                i32.const 0
                local.set $var7
                local.get $var1
                local.set $var8
                br $label3
              end $label2
              i32.const 0
              local.set $var7
              i32.const 0
              local.set $var9
              local.get $var1
              local.set $var8
              loop $label8
                local.get $var8
                local.tee $var4
                local.get $var5
                i32.eq
                br_if $label1
                block $label5
                  block $label4
                    local.get $var4
                    i32.load8_s
                    local.tee $var8
                    i32.const -1
                    i32.le_s
                    br_if $label4
                    local.get $var4
                    i32.const 1
                    i32.add
                    local.set $var8
                    br $label5
                  end $label4
                  block $label6
                    local.get $var8
                    i32.const -32
                    i32.ge_u
                    br_if $label6
                    local.get $var4
                    i32.const 2
                    i32.add
                    local.set $var8
                    br $label5
                  end $label6
                  block $label7
                    local.get $var8
                    i32.const -16
                    i32.ge_u
                    br_if $label7
                    local.get $var4
                    i32.const 3
                    i32.add
                    local.set $var8
                    br $label5
                  end $label7
                  local.get $var4
                  i32.const 4
                  i32.add
                  local.set $var8
                end $label5
                local.get $var8
                local.get $var4
                i32.sub
                local.get $var7
                i32.add
                local.set $var7
                local.get $var6
                local.get $var9
                i32.const 1
                i32.add
                local.tee $var9
                i32.ne
                br_if $label8
              end $label8
            end $label3
            local.get $var8
            local.get $var5
            i32.eq
            br_if $label1
            block $label9
              local.get $var8
              i32.load8_s
              local.tee $var4
              i32.const -1
              i32.gt_s
              br_if $label9
              local.get $var4
              i32.const -32
              i32.lt_u
              drop
            end $label9
            block $label12
              block $label10
                local.get $var7
                i32.eqz
                br_if $label10
                block $label11
                  local.get $var7
                  local.get $var2
                  i32.ge_u
                  br_if $label11
                  i32.const 0
                  local.set $var4
                  local.get $var1
                  local.get $var7
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  br_if $label10
                  br $label12
                end $label11
                i32.const 0
                local.set $var4
                local.get $var7
                local.get $var2
                i32.ne
                br_if $label12
              end $label10
              local.get $var1
              local.set $var4
            end $label12
            local.get $var7
            local.get $var2
            local.get $var4
            select
            local.set $var2
            local.get $var4
            local.get $var1
            local.get $var4
            select
            local.set $var1
          end $label1
          block $label13
            local.get $var3
            br_if $label13
            local.get $var0
            i32.load offset=20
            local.get $var1
            local.get $var2
            local.get $var0
            i32.load offset=24
            i32.load offset=12
            call_indirect (param i32 i32 i32) (result i32)
            return
          end $label13
          local.get $var0
          i32.load offset=4
          local.set $var10
          block $label14
            local.get $var2
            i32.const 16
            i32.lt_u
            br_if $label14
            local.get $var2
            local.get $var1
            local.get $var1
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.tee $var7
            i32.sub
            local.tee $var9
            i32.add
            local.tee $var11
            i32.const 3
            i32.and
            local.set $var3
            i32.const 0
            local.set $var6
            i32.const 0
            local.set $var4
            block $label15
              local.get $var1
              local.get $var7
              i32.eq
              br_if $label15
              i32.const 0
              local.set $var4
              block $label16
                local.get $var9
                i32.const -4
                i32.gt_u
                br_if $label16
                i32.const 0
                local.set $var4
                i32.const 0
                local.set $var5
                loop $label17
                  local.get $var4
                  local.get $var1
                  local.get $var5
                  i32.add
                  local.tee $var8
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get $var8
                  i32.const 1
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get $var8
                  i32.const 2
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get $var8
                  i32.const 3
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.set $var4
                  local.get $var5
                  i32.const 4
                  i32.add
                  local.tee $var5
                  br_if $label17
                end $label17
              end $label16
              local.get $var1
              local.set $var8
              loop $label18
                local.get $var4
                local.get $var8
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.set $var4
                local.get $var8
                i32.const 1
                i32.add
                local.set $var8
                local.get $var9
                i32.const 1
                i32.add
                local.tee $var9
                br_if $label18
              end $label18
            end $label15
            block $label19
              local.get $var3
              i32.eqz
              br_if $label19
              local.get $var7
              local.get $var11
              i32.const -4
              i32.and
              i32.add
              local.tee $var8
              i32.load8_s
              i32.const -65
              i32.gt_s
              local.set $var6
              local.get $var3
              i32.const 1
              i32.eq
              br_if $label19
              local.get $var6
              local.get $var8
              i32.load8_s offset=1
              i32.const -65
              i32.gt_s
              i32.add
              local.set $var6
              local.get $var3
              i32.const 2
              i32.eq
              br_if $label19
              local.get $var6
              local.get $var8
              i32.load8_s offset=2
              i32.const -65
              i32.gt_s
              i32.add
              local.set $var6
            end $label19
            local.get $var11
            i32.const 2
            i32.shr_u
            local.set $var5
            local.get $var6
            local.get $var4
            i32.add
            local.set $var6
            loop $label23
              local.get $var7
              local.set $var3
              local.get $var5
              i32.eqz
              br_if $label20
              local.get $var5
              i32.const 192
              local.get $var5
              i32.const 192
              i32.lt_u
              select
              local.tee $var11
              i32.const 3
              i32.and
              local.set $var12
              local.get $var11
              i32.const 2
              i32.shl
              local.set $var13
              i32.const 0
              local.set $var8
              block $label21
                local.get $var5
                i32.const 4
                i32.lt_u
                br_if $label21
                local.get $var3
                local.get $var13
                i32.const 1008
                i32.and
                i32.add
                local.set $var9
                i32.const 0
                local.set $var8
                local.get $var3
                local.set $var4
                loop $label22
                  local.get $var4
                  i32.load offset=12
                  local.tee $var7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get $var7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get $var4
                  i32.load offset=8
                  local.tee $var7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get $var7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get $var4
                  i32.load offset=4
                  local.tee $var7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get $var7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get $var4
                  i32.load
                  local.tee $var7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get $var7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get $var8
                  i32.add
                  i32.add
                  i32.add
                  i32.add
                  local.set $var8
                  local.get $var4
                  i32.const 16
                  i32.add
                  local.tee $var4
                  local.get $var9
                  i32.ne
                  br_if $label22
                end $label22
              end $label21
              local.get $var5
              local.get $var11
              i32.sub
              local.set $var5
              local.get $var3
              local.get $var13
              i32.add
              local.set $var7
              local.get $var8
              i32.const 8
              i32.shr_u
              i32.const 16711935
              i32.and
              local.get $var8
              i32.const 16711935
              i32.and
              i32.add
              i32.const 65537
              i32.mul
              i32.const 16
              i32.shr_u
              local.get $var6
              i32.add
              local.set $var6
              local.get $var12
              i32.eqz
              br_if $label23
            end $label23
            local.get $var3
            local.get $var11
            i32.const 252
            i32.and
            i32.const 2
            i32.shl
            i32.add
            local.tee $var8
            i32.load
            local.tee $var4
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get $var4
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.set $var4
            local.get $var12
            i32.const 1
            i32.eq
            br_if $label24
            local.get $var8
            i32.load offset=4
            local.tee $var7
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get $var7
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get $var4
            i32.add
            local.set $var4
            local.get $var12
            i32.const 2
            i32.eq
            br_if $label24
            local.get $var8
            i32.load offset=8
            local.tee $var8
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get $var8
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get $var4
            i32.add
            local.set $var4
            br $label24
          end $label14
          block $label25
            local.get $var2
            br_if $label25
            i32.const 0
            local.set $var6
            br $label20
          end $label25
          local.get $var2
          i32.const 3
          i32.and
          local.set $var8
          block $label27
            block $label26
              local.get $var2
              i32.const 4
              i32.ge_u
              br_if $label26
              i32.const 0
              local.set $var6
              i32.const 0
              local.set $var9
              br $label27
            end $label26
            i32.const 0
            local.set $var6
            local.get $var1
            local.set $var4
            local.get $var2
            i32.const 12
            i32.and
            local.tee $var9
            local.set $var7
            loop $label28
              local.get $var6
              local.get $var4
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get $var4
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get $var4
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get $var4
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set $var6
              local.get $var4
              i32.const 4
              i32.add
              local.set $var4
              local.get $var7
              i32.const -4
              i32.add
              local.tee $var7
              br_if $label28
            end $label28
          end $label27
          local.get $var8
          i32.eqz
          br_if $label20
          local.get $var1
          local.get $var9
          i32.add
          local.set $var4
          loop $label29
            local.get $var6
            local.get $var4
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set $var6
            local.get $var4
            i32.const 1
            i32.add
            local.set $var4
            local.get $var8
            i32.const -1
            i32.add
            local.tee $var8
            br_if $label29
            br $label20
          end $label29
        end $label0
        local.get $var0
        i32.load offset=20
        local.get $var1
        local.get $var2
        local.get $var0
        i32.load offset=24
        i32.load offset=12
        call_indirect (param i32 i32 i32) (result i32)
        return
      end $label24
      local.get $var4
      i32.const 8
      i32.shr_u
      i32.const 459007
      i32.and
      local.get $var4
      i32.const 16711935
      i32.and
      i32.add
      i32.const 65537
      i32.mul
      i32.const 16
      i32.shr_u
      local.get $var6
      i32.add
      local.set $var6
    end $label20
    block $label34
      block $label30
        local.get $var10
        local.get $var6
        i32.le_u
        br_if $label30
        local.get $var10
        local.get $var6
        i32.sub
        local.set $var5
        i32.const 0
        local.set $var4
        block $label31
          block $label33
            block $label32
              local.get $var0
              i32.load8_u offset=32
              br_table $label31 $label32 $label33 $label31 $label31
            end $label32
            local.get $var5
            local.set $var4
            i32.const 0
            local.set $var5
            br $label31
          end $label33
          local.get $var5
          i32.const 1
          i32.shr_u
          local.set $var4
          local.get $var5
          i32.const 1
          i32.add
          i32.const 1
          i32.shr_u
          local.set $var5
        end $label31
        local.get $var4
        i32.const 1
        i32.add
        local.set $var4
        local.get $var0
        i32.load offset=16
        local.set $var9
        local.get $var0
        i32.load offset=24
        local.set $var8
        local.get $var0
        i32.load offset=20
        local.set $var7
        loop $label35
          local.get $var4
          i32.const -1
          i32.add
          local.tee $var4
          i32.eqz
          br_if $label34
          local.get $var7
          local.get $var9
          local.get $var8
          i32.load offset=16
          call_indirect (param i32 i32) (result i32)
          i32.eqz
          br_if $label35
        end $label35
        i32.const 1
        return
      end $label30
      local.get $var0
      i32.load offset=20
      local.get $var1
      local.get $var2
      local.get $var0
      i32.load offset=24
      i32.load offset=12
      call_indirect (param i32 i32 i32) (result i32)
      return
    end $label34
    i32.const 1
    local.set $var4
    block $label36
      local.get $var7
      local.get $var1
      local.get $var2
      local.get $var8
      i32.load offset=12
      call_indirect (param i32 i32 i32) (result i32)
      br_if $label36
      i32.const 0
      local.set $var4
      block $label38
        loop $label39
          block $label37
            local.get $var5
            local.get $var4
            i32.ne
            br_if $label37
            local.get $var5
            local.set $var4
            br $label38
          end $label37
          local.get $var4
          i32.const 1
          i32.add
          local.set $var4
          local.get $var7
          local.get $var9
          local.get $var8
          i32.load offset=16
          call_indirect (param i32 i32) (result i32)
          i32.eqz
          br_if $label39
        end $label39
        local.get $var4
        i32.const -1
        i32.add
        local.set $var4
      end $label38
      local.get $var4
      local.get $var5
      i32.lt_u
      local.set $var4
    end $label36
    local.get $var4
  )
  (func $_ZN4core9panicking19assert_failed_inner17hc95b7725cb4077cbE (;27;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    (local $var4 i64)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    i32.const 1049668
    i32.store offset=12
    local.get $var3
    local.get $var0
    i32.store offset=8
    local.get $var3
    i32.const 1049668
    i32.store offset=20
    local.get $var3
    local.get $var1
    i32.store offset=16
    local.get $var3
    i32.const 2
    i32.store offset=28
    local.get $var3
    i32.const 1048772
    i32.store offset=24
    block $label0
      local.get $var2
      i32.load
      br_if $label0
      local.get $var3
      i32.const 3
      i32.store offset=92
      local.get $var3
      i32.const 1048824
      i32.store offset=88
      local.get $var3
      i64.const 3
      i64.store offset=100 align=4
      local.get $var3
      i32.const 3
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee $var4
      local.get $var3
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=72
      local.get $var3
      local.get $var4
      local.get $var3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=64
      local.get $var3
      i32.const 1
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get $var3
      i32.const 24
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get $var3
      local.get $var3
      i32.const 56
      i32.add
      i32.store offset=96
      local.get $var3
      i32.const 88
      i32.add
      i32.const 1049552
      call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
      unreachable
    end $label0
    local.get $var3
    i32.const 32
    i32.add
    i32.const 16
    i32.add
    local.get $var2
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get $var3
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get $var2
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get $var3
    local.get $var2
    i64.load align=4
    i64.store offset=32
    local.get $var3
    i32.const 4
    i32.store offset=92
    local.get $var3
    i32.const 1048876
    i32.store offset=88
    local.get $var3
    i64.const 4
    i64.store offset=100 align=4
    local.get $var3
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $var4
    local.get $var3
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=80
    local.get $var3
    local.get $var4
    local.get $var3
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get $var3
    i32.const 4
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $var3
    i32.const 32
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=64
    local.get $var3
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $var3
    i32.const 24
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get $var3
    local.get $var3
    i32.const 56
    i32.add
    i32.store offset=96
    local.get $var3
    i32.const 88
    i32.add
    i32.const 1049552
    call $_ZN4core9panicking9panic_fmt17hde8b7aa66e2831e1E
    unreachable
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd1c3de5eced27c6E (;28;) (param $var0 i32) (param $var1 i32) (result i32)
    local.get $var0
    i32.load
    local.get $var1
    local.get $var0
    i32.load offset=4
    i32.load offset=12
    call_indirect (param i32 i32) (result i32)
  )
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h9634f975d7713204E (;29;) (param $var0 i32) (param $var1 i32) (result i32)
    local.get $var1
    local.get $var0
    i32.load
    local.get $var0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17hdad3e25ba05328b0E
  )
  (func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h9f0c1cb30e5cfa6fE (;30;) (param $var0 i32) (param $var1 i32) (result i32)
    local.get $var1
    i32.load offset=20
    local.get $var1
    i32.load offset=24
    local.get $var0
    call $_ZN4core3fmt5write17hbbcd4b328f92d3c5E
  )
  (func $_ZN4core3fmt5write17hbbcd4b328f92d3c5E (;31;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    i32.const 3
    i32.store8 offset=44
    local.get $var3
    i32.const 32
    i32.store offset=28
    i32.const 0
    local.set $var4
    local.get $var3
    i32.const 0
    i32.store offset=40
    local.get $var3
    local.get $var1
    i32.store offset=36
    local.get $var3
    local.get $var0
    i32.store offset=32
    local.get $var3
    i32.const 0
    i32.store offset=20
    local.get $var3
    i32.const 0
    i32.store offset=12
    block $label14
      block $label13
        block $label3
          block $label1
            block $label0
              local.get $var2
              i32.load offset=16
              local.tee $var5
              br_if $label0
              local.get $var2
              i32.load offset=12
              local.tee $var0
              i32.eqz
              br_if $label1
              local.get $var2
              i32.load offset=8
              local.set $var1
              local.get $var0
              i32.const 3
              i32.shl
              local.set $var6
              local.get $var0
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set $var4
              local.get $var2
              i32.load
              local.set $var0
              loop $label4
                block $label2
                  local.get $var0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee $var7
                  i32.eqz
                  br_if $label2
                  local.get $var3
                  i32.load offset=32
                  local.get $var0
                  i32.load
                  local.get $var7
                  local.get $var3
                  i32.load offset=36
                  i32.load offset=12
                  call_indirect (param i32 i32 i32) (result i32)
                  br_if $label3
                end $label2
                local.get $var1
                i32.load
                local.get $var3
                i32.const 12
                i32.add
                local.get $var1
                i32.load offset=4
                call_indirect (param i32 i32) (result i32)
                br_if $label3
                local.get $var1
                i32.const 8
                i32.add
                local.set $var1
                local.get $var0
                i32.const 8
                i32.add
                local.set $var0
                local.get $var6
                i32.const -8
                i32.add
                local.tee $var6
                br_if $label4
                br $label1
              end $label4
            end $label0
            local.get $var2
            i32.load offset=20
            local.tee $var1
            i32.eqz
            br_if $label1
            local.get $var1
            i32.const 5
            i32.shl
            local.set $var8
            local.get $var1
            i32.const -1
            i32.add
            i32.const 134217727
            i32.and
            i32.const 1
            i32.add
            local.set $var4
            local.get $var2
            i32.load offset=8
            local.set $var9
            local.get $var2
            i32.load
            local.set $var0
            i32.const 0
            local.set $var6
            loop $label12
              block $label5
                local.get $var0
                i32.const 4
                i32.add
                i32.load
                local.tee $var1
                i32.eqz
                br_if $label5
                local.get $var3
                i32.load offset=32
                local.get $var0
                i32.load
                local.get $var1
                local.get $var3
                i32.load offset=36
                i32.load offset=12
                call_indirect (param i32 i32 i32) (result i32)
                br_if $label3
              end $label5
              local.get $var3
              local.get $var5
              local.get $var6
              i32.add
              local.tee $var1
              i32.const 16
              i32.add
              i32.load
              i32.store offset=28
              local.get $var3
              local.get $var1
              i32.const 28
              i32.add
              i32.load8_u
              i32.store8 offset=44
              local.get $var3
              local.get $var1
              i32.const 24
              i32.add
              i32.load
              i32.store offset=40
              local.get $var1
              i32.const 12
              i32.add
              i32.load
              local.set $var7
              i32.const 0
              local.set $var10
              i32.const 0
              local.set $var11
              block $label8
                block $label6
                  block $label7
                    local.get $var1
                    i32.const 8
                    i32.add
                    i32.load
                    br_table $label6 $label7 $label8 $label6
                  end $label7
                  local.get $var7
                  i32.const 3
                  i32.shl
                  local.set $var12
                  i32.const 0
                  local.set $var11
                  local.get $var9
                  local.get $var12
                  i32.add
                  local.tee $var12
                  i32.load offset=4
                  br_if $label8
                  local.get $var12
                  i32.load
                  local.set $var7
                end $label6
                i32.const 1
                local.set $var11
              end $label8
              local.get $var3
              local.get $var7
              i32.store offset=16
              local.get $var3
              local.get $var11
              i32.store offset=12
              local.get $var1
              i32.const 4
              i32.add
              i32.load
              local.set $var7
              block $label11
                block $label9
                  block $label10
                    local.get $var1
                    i32.load
                    br_table $label9 $label10 $label11 $label9
                  end $label10
                  local.get $var7
                  i32.const 3
                  i32.shl
                  local.set $var11
                  local.get $var9
                  local.get $var11
                  i32.add
                  local.tee $var11
                  i32.load offset=4
                  br_if $label11
                  local.get $var11
                  i32.load
                  local.set $var7
                end $label9
                i32.const 1
                local.set $var10
              end $label11
              local.get $var3
              local.get $var7
              i32.store offset=24
              local.get $var3
              local.get $var10
              i32.store offset=20
              local.get $var9
              local.get $var1
              i32.const 20
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee $var1
              i32.load
              local.get $var3
              i32.const 12
              i32.add
              local.get $var1
              i32.load offset=4
              call_indirect (param i32 i32) (result i32)
              br_if $label3
              local.get $var0
              i32.const 8
              i32.add
              local.set $var0
              local.get $var8
              local.get $var6
              i32.const 32
              i32.add
              local.tee $var6
              i32.ne
              br_if $label12
            end $label12
          end $label1
          local.get $var4
          local.get $var2
          i32.load offset=4
          i32.ge_u
          br_if $label13
          local.get $var3
          i32.load offset=32
          local.get $var2
          i32.load
          local.get $var4
          i32.const 3
          i32.shl
          i32.add
          local.tee $var1
          i32.load
          local.get $var1
          i32.load offset=4
          local.get $var3
          i32.load offset=36
          i32.load offset=12
          call_indirect (param i32 i32 i32) (result i32)
          i32.eqz
          br_if $label13
        end $label3
        i32.const 1
        local.set $var1
        br $label14
      end $label13
      i32.const 0
      local.set $var1
    end $label14
    local.get $var3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get $var1
  )
  (func $_ZN4core6option13unwrap_failed17h9aa82eb71128b127E (;32;)
    i32.const 1048660
    i32.const 43
    i32.const 1049400
    call $_ZN4core9panicking5panic17hcaca2598a27ec0fcE
    unreachable
  )
  (func $_ZN4core9panicking13assert_failed17h8cbd36d22f47c107E (;33;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    local.get $var2
    i32.const 1049456
    i32.store offset=12
    local.get $var2
    local.get $var0
    i32.store offset=8
    local.get $var2
    i32.const 8
    i32.add
    local.get $var2
    i32.const 12
    i32.add
    local.get $var1
    call $_ZN4core9panicking19assert_failed_inner17hc95b7725cb4077cbE
    unreachable
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca6fb0e1cb4c7861E (;34;) (param $var0 i32) (param $var1 i32) (result i32)
    block $label0
      local.get $var0
      i32.load
      i32.load8_u
      br_if $label0
      local.get $var1
      i32.const 1049108
      i32.const 5
      call $_ZN4core3fmt9Formatter3pad17hdad3e25ba05328b0E
      return
    end $label0
    local.get $var1
    i32.const 1049113
    i32.const 4
    call $_ZN4core3fmt9Formatter3pad17hdad3e25ba05328b0E
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h2bd763bd9d30075bE (;35;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    block $label4
      block $label1
        block $label0
          local.get $var0
          i32.load
          local.tee $var2
          i32.const -1
          i32.ne
          br_if $label0
          i32.const 0
          local.set $var1
          br $label1
        end $label0
        i32.const 4
        local.set $var3
        local.get $var2
        i32.const 1
        i32.shl
        local.tee $var4
        local.get $var2
        i32.const 1
        i32.add
        local.tee $var5
        local.get $var4
        local.get $var5
        i32.gt_u
        select
        local.tee $var4
        i32.const 4
        local.get $var4
        i32.const 4
        i32.gt_u
        select
        local.tee $var6
        i32.const 3
        i32.shl
        local.set $var5
        local.get $var4
        i32.const 268435456
        i32.lt_u
        i32.const 2
        i32.shl
        local.set $var4
        block $label3
          block $label2
            local.get $var2
            br_if $label2
            i32.const 0
            local.set $var3
            br $label3
          end $label2
          local.get $var1
          local.get $var2
          i32.const 3
          i32.shl
          i32.store offset=28
          local.get $var1
          local.get $var0
          i32.load offset=4
          i32.store offset=20
        end $label3
        local.get $var1
        local.get $var3
        i32.store offset=24
        local.get $var1
        i32.const 8
        i32.add
        local.get $var4
        local.get $var5
        local.get $var1
        i32.const 20
        i32.add
        call $_ZN5alloc7raw_vec11finish_grow17h505173849977e6e7E
        local.get $var1
        i32.load offset=8
        i32.eqz
        br_if $label4
        local.get $var1
        i32.load offset=16
        local.set $var2
        local.get $var1
        i32.load offset=12
        local.set $var1
      end $label1
      local.get $var1
      local.get $var2
      call $_ZN5alloc7raw_vec12handle_error17h76131d670f53a5eeE
      unreachable
    end $label4
    local.get $var1
    i32.load offset=12
    local.set $var2
    local.get $var0
    local.get $var6
    i32.store
    local.get $var0
    local.get $var2
    i32.store offset=4
    local.get $var1
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN4core3ops8function6FnOnce9call_once17hdddb86c5a6ab6037E (;36;) (param $var0 i32)
    local.get $var0
    i32.const 0
    i32.store offset=12
    local.get $var0
    i64.const 17179869184
    i64.store offset=4 align=4
    local.get $var0
    i32.const 0
    i32.store8
  )
  (func $_ZN5alloc7raw_vec11finish_grow17h505173849977e6e7E (;37;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32)
    (local $var4 i32)
    block $label9
      block $label7
        block $label6
          block $label4
            block $label1
              block $label0
                local.get $var1
                i32.eqz
                br_if $label0
                local.get $var2
                i32.const -1
                i32.le_s
                br_if $label1
                block $label5
                  block $label2
                    local.get $var3
                    i32.load offset=4
                    i32.eqz
                    br_if $label2
                    block $label3
                      local.get $var3
                      i32.load offset=8
                      local.tee $var4
                      br_if $label3
                      local.get $var2
                      i32.eqz
                      br_if $label4
                      i32.const 0
                      i32.load8_u offset=1050688
                      drop
                      br $label5
                    end $label3
                    local.get $var3
                    i32.load
                    local.get $var4
                    local.get $var2
                    call $__rust_realloc
                    local.set $var3
                    br $label6
                  end $label2
                  local.get $var2
                  i32.eqz
                  br_if $label4
                  i32.const 0
                  i32.load8_u offset=1050688
                  drop
                end $label5
                local.get $var2
                call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17ha99e3efb2d98b193E
                local.set $var3
                br $label6
              end $label0
              local.get $var0
              i32.const 0
              i32.store offset=4
              br $label7
            end $label1
            local.get $var0
            i32.const 0
            i32.store offset=4
            br $label7
          end $label4
          local.get $var1
          local.set $var3
        end $label6
        block $label8
          local.get $var3
          i32.eqz
          br_if $label8
          local.get $var0
          local.get $var2
          i32.store offset=8
          local.get $var0
          local.get $var3
          i32.store offset=4
          i32.const 0
          local.set $var2
          br $label9
        end $label8
        local.get $var0
        local.get $var2
        i32.store offset=8
        local.get $var0
        local.get $var1
        i32.store offset=4
      end $label7
      i32.const 1
      local.set $var2
    end $label9
    local.get $var0
    local.get $var2
    i32.store
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14grow_amortized17hba8b8fb762074d15E (;38;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var4
    global.set $__stack_pointer
    block $label1
      block $label0
        local.get $var2
        local.get $var3
        i32.add
        local.tee $var3
        local.get $var2
        i32.ge_u
        br_if $label0
        i32.const 0
        local.set $var2
        br $label1
      end $label0
      i32.const 1
      local.set $var5
      local.get $var1
      i32.load
      local.tee $var6
      i32.const 1
      i32.shl
      local.tee $var2
      local.get $var3
      local.get $var2
      local.get $var3
      i32.gt_u
      select
      local.tee $var2
      i32.const 4
      local.get $var2
      i32.const 4
      i32.gt_u
      select
      local.tee $var7
      i32.const 2
      i32.shl
      local.set $var3
      local.get $var2
      i32.const 536870912
      i32.lt_u
      local.set $var2
      block $label3
        block $label2
          local.get $var6
          br_if $label2
          i32.const 0
          local.set $var5
          br $label3
        end $label2
        local.get $var4
        local.get $var6
        i32.const 2
        i32.shl
        i32.store offset=28
        local.get $var4
        local.get $var1
        i32.load offset=4
        i32.store offset=20
      end $label3
      local.get $var4
      local.get $var5
      i32.store offset=24
      local.get $var4
      i32.const 8
      i32.add
      local.get $var2
      local.get $var3
      local.get $var4
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h505173849977e6e7E
      block $label4
        local.get $var4
        i32.load offset=8
        br_if $label4
        local.get $var4
        i32.load offset=12
        local.set $var2
        local.get $var1
        local.get $var7
        i32.store
        local.get $var1
        local.get $var2
        i32.store offset=4
        i32.const -2147483647
        local.set $var2
        br $label1
      end $label4
      local.get $var4
      i32.load offset=16
      local.set $var1
      local.get $var4
      i32.load offset=12
      local.set $var2
    end $label1
    local.get $var0
    local.get $var1
    i32.store offset=4
    local.get $var0
    local.get $var2
    i32.store
    local.get $var4
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h389f3fe9d02e3ce9E (;39;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    block $label4
      block $label1
        block $label0
          local.get $var0
          i32.load
          local.tee $var2
          i32.const -1
          i32.ne
          br_if $label0
          i32.const 0
          local.set $var1
          br $label1
        end $label0
        i32.const 1
        local.set $var3
        local.get $var2
        i32.const 1
        i32.shl
        local.tee $var4
        local.get $var2
        i32.const 1
        i32.add
        local.tee $var5
        local.get $var4
        local.get $var5
        i32.gt_u
        select
        local.tee $var4
        i32.const 4
        local.get $var4
        i32.const 4
        i32.gt_u
        select
        local.tee $var6
        i32.const 4
        i32.shl
        local.set $var5
        local.get $var4
        i32.const 134217728
        i32.lt_u
        local.set $var4
        block $label3
          block $label2
            local.get $var2
            br_if $label2
            i32.const 0
            local.set $var3
            br $label3
          end $label2
          local.get $var1
          local.get $var2
          i32.const 4
          i32.shl
          i32.store offset=28
          local.get $var1
          local.get $var0
          i32.load offset=4
          i32.store offset=20
        end $label3
        local.get $var1
        local.get $var3
        i32.store offset=24
        local.get $var1
        i32.const 8
        i32.add
        local.get $var4
        local.get $var5
        local.get $var1
        i32.const 20
        i32.add
        call $_ZN5alloc7raw_vec11finish_grow17h505173849977e6e7E
        local.get $var1
        i32.load offset=8
        i32.eqz
        br_if $label4
        local.get $var1
        i32.load offset=16
        local.set $var2
        local.get $var1
        i32.load offset=12
        local.set $var1
      end $label1
      local.get $var1
      local.get $var2
      call $_ZN5alloc7raw_vec12handle_error17h76131d670f53a5eeE
      unreachable
    end $label4
    local.get $var1
    i32.load offset=12
    local.set $var2
    local.get $var0
    local.get $var6
    i32.store
    local.get $var0
    local.get $var2
    i32.store offset=4
    local.get $var1
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hfe467b9c4e992157E (;40;) (param $var0 i32)
    (local $var1 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var1
    i32.const 8
    i32.add
    local.get $var0
    local.get $var0
    i32.load
    i32.const 1
    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14grow_amortized17hba8b8fb762074d15E
    block $label0
      local.get $var1
      i32.load offset=8
      local.tee $var0
      i32.const -2147483647
      i32.eq
      br_if $label0
      local.get $var0
      local.get $var1
      i32.load offset=12
      call $_ZN5alloc7raw_vec12handle_error17h76131d670f53a5eeE
      unreachable
    end $label0
    local.get $var1
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $rust_panic (;41;)
    unreachable
    unreachable
  )
  (func $_ZN4core5panic12PanicPayload6as_str17h59025c0ecbb0f54eE (;42;) (param $var0 i32) (param $var1 i32)
    local.get $var0
    i32.const 0
    i32.store
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hed6bdaacb86779faE (;43;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    i32.const 31
    local.set $var2
    block $label0
      local.get $var1
      i32.const 16777215
      i32.gt_u
      br_if $label0
      local.get $var1
      i32.const 6
      local.get $var1
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee $var2
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get $var2
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set $var2
    end $label0
    local.get $var0
    i64.const 0
    i64.store offset=16 align=4
    local.get $var0
    local.get $var2
    i32.store offset=28
    local.get $var2
    i32.const 2
    i32.shl
    i32.const 1050700
    i32.add
    local.set $var3
    block $label1
      i32.const 0
      i32.load offset=1051112
      i32.const 1
      local.get $var2
      i32.shl
      local.tee $var4
      i32.and
      br_if $label1
      local.get $var3
      local.get $var0
      i32.store
      local.get $var0
      local.get $var3
      i32.store offset=24
      local.get $var0
      local.get $var0
      i32.store offset=12
      local.get $var0
      local.get $var0
      i32.store offset=8
      i32.const 0
      i32.const 0
      i32.load offset=1051112
      local.get $var4
      i32.or
      i32.store offset=1051112
      return
    end $label1
    block $label4
      block $label3
        block $label2
          local.get $var3
          i32.load
          local.tee $var4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get $var1
          i32.ne
          br_if $label2
          local.get $var4
          local.set $var2
          br $label3
        end $label2
        local.get $var1
        i32.const 0
        i32.const 25
        local.get $var2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get $var2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set $var3
        loop $label5
          local.get $var4
          local.get $var3
          i32.const 29
          i32.shr_u
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee $var5
          i32.load
          local.tee $var2
          i32.eqz
          br_if $label4
          local.get $var3
          i32.const 1
          i32.shl
          local.set $var3
          local.get $var2
          local.set $var4
          local.get $var2
          i32.load offset=4
          i32.const -8
          i32.and
          local.get $var1
          i32.ne
          br_if $label5
        end $label5
      end $label3
      local.get $var2
      i32.load offset=8
      local.tee $var3
      local.get $var0
      i32.store offset=12
      local.get $var2
      local.get $var0
      i32.store offset=8
      local.get $var0
      i32.const 0
      i32.store offset=24
      local.get $var0
      local.get $var2
      i32.store offset=12
      local.get $var0
      local.get $var3
      i32.store offset=8
      return
    end $label4
    local.get $var5
    local.get $var0
    i32.store
    local.get $var0
    local.get $var4
    i32.store offset=24
    local.get $var0
    local.get $var0
    i32.store offset=12
    local.get $var0
    local.get $var0
    i32.store offset=8
  )
  (func $_ZN3std3sys9backtrace26__rust_end_short_backtrace17h2bcfc60c3cf0a312E (;44;) (param $var0 i32)
    local.get $var0
    call $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h98de848d678bad07E
    unreachable
  )
  (func $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h98de848d678bad07E (;45;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var0
    i32.load offset=12
    local.set $var2
    block $label3
      block $label2
        block $label1
          block $label0
            local.get $var0
            i32.load offset=4
            br_table $label0 $label1 $label2
          end $label0
          local.get $var2
          br_if $label2
          i32.const 1
          local.set $var2
          i32.const 0
          local.set $var3
          br $label3
        end $label1
        local.get $var2
        br_if $label2
        local.get $var0
        i32.load
        local.tee $var2
        i32.load offset=4
        local.set $var3
        local.get $var2
        i32.load
        local.set $var2
        br $label3
      end $label2
      local.get $var1
      i32.const -2147483648
      i32.store
      local.get $var1
      local.get $var0
      i32.store offset=12
      local.get $var1
      i32.const 5
      local.get $var0
      i32.load offset=28
      local.tee $var0
      i32.load8_u offset=28
      local.get $var0
      i32.load8_u offset=29
      call $_ZN3std9panicking20rust_panic_with_hook17h33fe77d38d305ca3E
      unreachable
    end $label3
    local.get $var1
    local.get $var3
    i32.store offset=4
    local.get $var1
    local.get $var2
    i32.store
    local.get $var1
    i32.const 6
    local.get $var0
    i32.load offset=28
    local.tee $var0
    i32.load8_u offset=28
    local.get $var0
    i32.load8_u offset=29
    call $_ZN3std9panicking20rust_panic_with_hook17h33fe77d38d305ca3E
    unreachable
  )
  (func $_ZN3std9panicking20rust_panic_with_hook17h33fe77d38d305ca3E (;46;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var4
    global.set $__stack_pointer
    i32.const 0
    i32.const 0
    i32.load offset=1050696
    local.tee $var5
    i32.const 1
    i32.add
    i32.store offset=1050696
    block $label0
      local.get $var5
      i32.const 0
      i32.lt_s
      br_if $label0
      block $label2
        block $label1
          i32.const 0
          i32.load8_u offset=1051156
          br_if $label1
          i32.const 0
          i32.const 0
          i32.load offset=1051152
          i32.const 1
          i32.add
          i32.store offset=1051152
          i32.const 0
          i32.load offset=1050692
          i32.const -1
          i32.gt_s
          br_if $label2
          br $label0
        end $label1
        local.get $var4
        i32.const 8
        i32.add
        local.get $var0
        local.get $var1
        call_indirect (param i32 i32)
        unreachable
        unreachable
      end $label2
      i32.const 0
      i32.const 0
      i32.store8 offset=1051156
      local.get $var2
      i32.eqz
      br_if $label0
      call $rust_panic
      unreachable
    end $label0
    unreachable
    unreachable
  )
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17h35704e8c93457832E (;47;) (param $var0 i32) (param $var1 i32)
    local.get $var0
    local.get $var1
    i64.load align=4
    i64.store
  )
  (func $_ZN17compiler_builtins3mem6memcpy17h4d1b3bf0b8e43c13E (;48;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    block $label1
      block $label0
        local.get $var2
        i32.const 16
        i32.ge_u
        br_if $label0
        local.get $var0
        local.set $var3
        br $label1
      end $label0
      local.get $var0
      i32.const 0
      local.get $var0
      i32.sub
      i32.const 3
      i32.and
      local.tee $var4
      i32.add
      local.set $var5
      block $label2
        local.get $var4
        i32.eqz
        br_if $label2
        local.get $var0
        local.set $var3
        local.get $var1
        local.set $var6
        loop $label3
          local.get $var3
          local.get $var6
          i32.load8_u
          i32.store8
          local.get $var6
          i32.const 1
          i32.add
          local.set $var6
          local.get $var3
          i32.const 1
          i32.add
          local.tee $var3
          local.get $var5
          i32.lt_u
          br_if $label3
        end $label3
      end $label2
      local.get $var5
      local.get $var2
      local.get $var4
      i32.sub
      local.tee $var7
      i32.const -4
      i32.and
      local.tee $var8
      i32.add
      local.set $var3
      block $label5
        block $label4
          local.get $var1
          local.get $var4
          i32.add
          local.tee $var9
          i32.const 3
          i32.and
          i32.eqz
          br_if $label4
          local.get $var8
          i32.const 1
          i32.lt_s
          br_if $label5
          local.get $var9
          i32.const 3
          i32.shl
          local.tee $var6
          i32.const 24
          i32.and
          local.set $var2
          local.get $var9
          i32.const -4
          i32.and
          local.tee $var10
          i32.const 4
          i32.add
          local.set $var1
          i32.const 0
          local.get $var6
          i32.sub
          i32.const 24
          i32.and
          local.set $var4
          local.get $var10
          i32.load
          local.set $var6
          loop $label6
            local.get $var5
            local.get $var6
            local.get $var2
            i32.shr_u
            local.get $var1
            i32.load
            local.tee $var6
            local.get $var4
            i32.shl
            i32.or
            i32.store
            local.get $var1
            i32.const 4
            i32.add
            local.set $var1
            local.get $var5
            i32.const 4
            i32.add
            local.tee $var5
            local.get $var3
            i32.lt_u
            br_if $label6
            br $label5
          end $label6
        end $label4
        local.get $var8
        i32.const 1
        i32.lt_s
        br_if $label5
        local.get $var9
        local.set $var1
        loop $label7
          local.get $var5
          local.get $var1
          i32.load
          i32.store
          local.get $var1
          i32.const 4
          i32.add
          local.set $var1
          local.get $var5
          i32.const 4
          i32.add
          local.tee $var5
          local.get $var3
          i32.lt_u
          br_if $label7
        end $label7
      end $label5
      local.get $var7
      i32.const 3
      i32.and
      local.set $var2
      local.get $var9
      local.get $var8
      i32.add
      local.set $var1
    end $label1
    block $label8
      local.get $var2
      i32.eqz
      br_if $label8
      local.get $var3
      local.get $var2
      i32.add
      local.set $var5
      loop $label9
        local.get $var3
        local.get $var1
        i32.load8_u
        i32.store8
        local.get $var1
        i32.const 1
        i32.add
        local.set $var1
        local.get $var3
        i32.const 1
        i32.add
        local.tee $var3
        local.get $var5
        i32.lt_u
        br_if $label9
      end $label9
    end $label8
    local.get $var0
  )
  (func $_ZN17compiler_builtins3mem6memset17h4739799fd37dc941E (;49;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    block $label1
      block $label0
        local.get $var2
        i32.const 16
        i32.ge_u
        br_if $label0
        local.get $var0
        local.set $var3
        br $label1
      end $label0
      local.get $var0
      i32.const 0
      local.get $var0
      i32.sub
      i32.const 3
      i32.and
      local.tee $var4
      i32.add
      local.set $var5
      block $label2
        local.get $var4
        i32.eqz
        br_if $label2
        local.get $var0
        local.set $var3
        loop $label3
          local.get $var3
          local.get $var1
          i32.store8
          local.get $var3
          i32.const 1
          i32.add
          local.tee $var3
          local.get $var5
          i32.lt_u
          br_if $label3
        end $label3
      end $label2
      local.get $var5
      local.get $var2
      local.get $var4
      i32.sub
      local.tee $var4
      i32.const -4
      i32.and
      local.tee $var2
      i32.add
      local.set $var3
      block $label4
        local.get $var2
        i32.const 1
        i32.lt_s
        br_if $label4
        local.get $var1
        i32.const 255
        i32.and
        i32.const 16843009
        i32.mul
        local.set $var2
        loop $label5
          local.get $var5
          local.get $var2
          i32.store
          local.get $var5
          i32.const 4
          i32.add
          local.tee $var5
          local.get $var3
          i32.lt_u
          br_if $label5
        end $label5
      end $label4
      local.get $var4
      i32.const 3
      i32.and
      local.set $var2
    end $label1
    block $label6
      local.get $var2
      i32.eqz
      br_if $label6
      local.get $var3
      local.get $var2
      i32.add
      local.set $var5
      loop $label7
        local.get $var3
        local.get $var1
        i32.store8
        local.get $var3
        i32.const 1
        i32.add
        local.tee $var3
        local.get $var5
        i32.lt_u
        br_if $label7
      end $label7
    end $label6
    local.get $var0
  )
  (func $memset (;50;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    local.get $var0
    local.get $var1
    local.get $var2
    call $_ZN17compiler_builtins3mem6memset17h4739799fd37dc941E
  )
  (func $memcpy (;51;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    local.get $var0
    local.get $var1
    local.get $var2
    call $_ZN17compiler_builtins3mem6memcpy17h4d1b3bf0b8e43c13E
  )
  (data (i32.const 1048576) "capacity overflow\00\00\00\00\00\10\00\11\00\00\00library/alloc/src/raw_vec.rs\1c\00\10\00\1c\00\00\00\19\00\00\00\05\00\00\00)\00\00\00\01\00\00\00\00\00\00\00called `Option::unwrap()` on a `None` valueindex out of bounds: the len is  but the index is \00\00\00\7f\00\10\00 \00\00\00\9f\00\10\00\12\00\00\00==assertion `left  right` failed\0a  left: \0a right: \00\00\c6\00\10\00\10\00\00\00\d6\00\10\00\17\00\00\00\ed\00\10\00\09\00\00\00 right` failed: \0a  left: \00\00\00\c6\00\10\00\10\00\00\00\10\01\10\00\10\00\00\00 \01\10\00\09\00\00\00\ed\00\10\00\09\00\00\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899falsetruesource slice length () does not match destination slice length (\00\00\00\1d\02\10\00\15\00\00\002\02\10\00+\00\00\00H\00\10\00\01\00\00\00Once instance has previously been poisoned\00\00x\02\10\00*\00\00\00one-time initialization may not be performed recursively\ac\02\10\008\00\00\00/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/std/src/sync/once.rs\ec\02\10\00L\00\00\00\9e\00\00\002\00\00\00cannot recursively acquire mutexH\03\10\00 \00\00\00\00/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/std/src/sys/sync/mutex/no_threads.rs\00\00\00q\03\10\00\5c\00\00\00\14\00\00\00\09\00\00\00/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/std/src/sync/lazy_lock.rs\00\00\00\e0\03\10\00Q\00\00\00\9d\00\00\00\13\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\07\00\00\00programs/src/aes/mod.rs\00T\04\10\00\17\00\00\00 \00\00\00\0b\00\00\00T\04\10\00\17\00\00\000\00\00\00\0b\00\00\00T\04\10\00\17\00\00\007\00\00\00\0b\00\00\00cannot access non-existent arrayT\04\10\00\17\00\00\00R\00\00\00\0e\00\00\00cannot drop non-existent array\00\00T\04\10\00\17\00\00\00[\00\00\00\0e\00\00\00c|w{\f2ko\c50\01g+\fe\d7\abv\ca\82\c9}\faYG\f0\ad\d4\a2\af\9c\a4r\c0\b7\fd\93&6?\f7\cc4\a5\e5\f1q\d81\15\04\c7#\c3\18\96\05\9a\07\12\80\e2\eb'\b2u\09\83,\1a\1bnZ\a0R;\d6\b3)\e3/\84S\d1\00\ed \fc\b1[j\cb\be9JLX\cf\d0\ef\aa\fbCM3\85E\f9\02\7fP<\9f\a8Q\a3@\8f\92\9d8\f5\bc\b6\da!\10\ff\f3\d2\cd\0c\13\ec_\97D\17\c4\a7~=d]\19s`\81O\dc\22*\90\88F\ee\b8\14\de^\0b\db\e02:\0aI\06$\5c\c2\d3\acb\91\95\e4y\e7\c87m\8d\d5N\a9lV\f4\eaez\ae\08\bax%.\1c\a6\b4\c6\e8\ddt\1fK\bd\8b\8ap>\b5fH\03\f6\0ea5W\b9\86\c1\1d\9e\e1\f8\98\11i\d9\8e\94\9b\1e\87\e9\ceU(\df\8c\a1\89\0d\bf\e6BhA\99-\0f\b0T\bb\16R\09j\d506\a58\bf@\a3\9e\81\f3\d7\fb|\e39\82\9b/\ff\874\8eCD\c4\de\e9\cbT{\942\a6\c2#=\eeL\95\0bB\fa\c3N\08.\a1f(\d9$\b2v[\a2Im\8b\d1%r\f8\f6d\86h\98\16\d4\a4\5c\cc]e\b6\92lpHP\fd\ed\b9\da^\15FW\a7\8d\9d\84\90\d8\ab\00\8c\bc\d3\0a\f7\e4X\05\b8\b3E\06\d0,\1e\8f\ca?\0f\02\c1\af\bd\03\01\13\8ak:\91\11AOg\dc\ea\97\f2\cf\ce\f0\b4\e6s\96\act\22\e7\ad5\85\e2\f97\e8\1cu\dfnG\f1\1aq\1d)\c5\89o\b7b\0e\aa\18\be\1b\fcV>K\c6\d2y \9a\db\c0\fex\cdZ\f4\1f\dd\a83\88\07\c71\b1\12\10Y'\80\ec_`Q\7f\a9\19\b5J\0d-\e5z\9f\93\c9\9c\ef\a0\e0;M\ae*\f5\b0\c8\eb\bb<\83S\99a\17+\04~\baw\d6&\e1i\14cU!\0c}\00\01\02\04\08\10 @\80\1b6programs/src/aes/cipher.rs\00\00\00\07\07\10\00\1a\00\00\00E\00\00\00*\00\00\00\07\07\10\00\1a\00\00\00\96\01\00\00 \00\00\00\07\07\10\00\1a\00\00\00\a3\01\00\00\1b\00\00\00\07\07\10\00\1a\00\00\00\9c\01\00\00$\00\00\00\07\07\10\00\1a\00\00\00\ae\01\00\00\1b\00\00\00\07\07\10\00\1a\00\00\00\b6\01\00\00$\00\00\00/rust/deps/dlmalloc-0.2.6/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\00\84\07\10\00)\00\00\00\a8\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\84\07\10\00)\00\00\00\ae\04\00\00\0d\00\00\00")
  (data (i32.const 1050668) "\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
)