(module $program_box.wasm
  (table $table0 1 1 funcref)
  (memory $memory (;0;) (export "memory") 17)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1049032))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1049040))
  (func $calc (;0;) (export "calc") (param $var0 i32) (result i32)
    (local $var1 i32)
    i32.const 0
    i32.load8_u offset=1048576
    drop
    block $label0
      i32.const 4
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17he65939a4c897cc15E
      local.tee $var1
      br_if $label0
      unreachable
    end $label0
    local.get $var1
    local.get $var0
    i32.const 42
    i32.add
    i32.store
    local.get $var1
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17he65939a4c897cc15E (;1;) (param $var0 i32) (result i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i64)
    block $label2
      block $label34
        block $label9
          block $label7
            block $label4
              block $label3
                block $label1
                  block $label0
                    local.get $var0
                    i32.const 244
                    i32.gt_u
                    br_if $label0
                    i32.const 0
                    i32.load offset=1048988
                    local.tee $var1
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
                    local.tee $var3
                    i32.shr_u
                    local.tee $var0
                    i32.const 3
                    i32.and
                    br_if $label1
                    local.get $var2
                    i32.const 0
                    i32.load offset=1048996
                    i32.le_u
                    br_if $label2
                    local.get $var0
                    br_if $label3
                    i32.const 0
                    i32.load offset=1048992
                    local.tee $var0
                    br_if $label4
                    br $label2
                  end $label0
                  local.get $var0
                  i32.const 11
                  i32.add
                  local.tee $var3
                  i32.const -8
                  i32.and
                  local.set $var2
                  i32.const 0
                  i32.load offset=1048992
                  local.tee $var4
                  i32.eqz
                  br_if $label2
                  i32.const 31
                  local.set $var5
                  block $label5
                    local.get $var0
                    i32.const 16777204
                    i32.gt_u
                    br_if $label5
                    local.get $var2
                    i32.const 6
                    local.get $var3
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
                    local.set $var5
                  end $label5
                  i32.const 0
                  local.get $var2
                  i32.sub
                  local.set $var3
                  block $label6
                    local.get $var5
                    i32.const 2
                    i32.shl
                    i32.const 1048580
                    i32.add
                    i32.load
                    local.tee $var1
                    br_if $label6
                    i32.const 0
                    local.set $var0
                    i32.const 0
                    local.set $var6
                    br $label7
                  end $label6
                  i32.const 0
                  local.set $var0
                  local.get $var2
                  i32.const 0
                  i32.const 25
                  local.get $var5
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get $var5
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set $var7
                  i32.const 0
                  local.set $var6
                  loop $label10
                    block $label8
                      local.get $var1
                      local.tee $var1
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.tee $var8
                      local.get $var2
                      i32.lt_u
                      br_if $label8
                      local.get $var8
                      local.get $var2
                      i32.sub
                      local.tee $var8
                      local.get $var3
                      i32.ge_u
                      br_if $label8
                      local.get $var8
                      local.set $var3
                      local.get $var1
                      local.set $var6
                      local.get $var8
                      br_if $label8
                      i32.const 0
                      local.set $var3
                      local.get $var1
                      local.set $var6
                      local.get $var1
                      local.set $var0
                      br $label9
                    end $label8
                    local.get $var1
                    i32.load offset=20
                    local.tee $var8
                    local.get $var0
                    local.get $var8
                    local.get $var1
                    local.get $var7
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    i32.const 16
                    i32.add
                    i32.load
                    local.tee $var1
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
                    local.get $var1
                    i32.eqz
                    br_if $label7
                    br $label10
                  end $label10
                end $label1
                block $label12
                  block $label11
                    local.get $var0
                    i32.const -1
                    i32.xor
                    i32.const 1
                    i32.and
                    local.get $var3
                    i32.add
                    local.tee $var7
                    i32.const 3
                    i32.shl
                    local.tee $var0
                    i32.const 1048724
                    i32.add
                    local.tee $var2
                    local.get $var0
                    i32.const 1048732
                    i32.add
                    i32.load
                    local.tee $var3
                    i32.load offset=8
                    local.tee $var6
                    i32.eq
                    br_if $label11
                    local.get $var6
                    local.get $var2
                    i32.store offset=12
                    local.get $var2
                    local.get $var6
                    i32.store offset=8
                    br $label12
                  end $label11
                  i32.const 0
                  local.get $var1
                  i32.const -2
                  local.get $var7
                  i32.rotl
                  i32.and
                  i32.store offset=1048988
                end $label12
                local.get $var3
                local.get $var0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get $var3
                local.get $var0
                i32.add
                local.tee $var0
                local.get $var0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $var3
                i32.const 8
                i32.add
                return
              end $label3
              block $label14
                block $label13
                  local.get $var0
                  local.get $var3
                  i32.shl
                  i32.const 2
                  local.get $var3
                  i32.shl
                  local.tee $var0
                  i32.const 0
                  local.get $var0
                  i32.sub
                  i32.or
                  i32.and
                  i32.ctz
                  local.tee $var8
                  i32.const 3
                  i32.shl
                  local.tee $var3
                  i32.const 1048724
                  i32.add
                  local.tee $var6
                  local.get $var3
                  i32.const 1048732
                  i32.add
                  i32.load
                  local.tee $var0
                  i32.load offset=8
                  local.tee $var7
                  i32.eq
                  br_if $label13
                  local.get $var7
                  local.get $var6
                  i32.store offset=12
                  local.get $var6
                  local.get $var7
                  i32.store offset=8
                  br $label14
                end $label13
                i32.const 0
                local.get $var1
                i32.const -2
                local.get $var8
                i32.rotl
                i32.and
                i32.store offset=1048988
              end $label14
              local.get $var0
              local.get $var2
              i32.const 3
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var2
              i32.add
              local.tee $var7
              local.get $var3
              local.get $var2
              i32.sub
              local.tee $var2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var3
              i32.add
              local.get $var2
              i32.store
              block $label15
                i32.const 0
                i32.load offset=1048996
                local.tee $var1
                i32.eqz
                br_if $label15
                local.get $var1
                i32.const -8
                i32.and
                i32.const 1048724
                i32.add
                local.set $var6
                i32.const 0
                i32.load offset=1049004
                local.set $var3
                block $label17
                  block $label16
                    i32.const 0
                    i32.load offset=1048988
                    local.tee $var8
                    i32.const 1
                    local.get $var1
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee $var1
                    i32.and
                    br_if $label16
                    i32.const 0
                    local.get $var8
                    local.get $var1
                    i32.or
                    i32.store offset=1048988
                    local.get $var6
                    local.set $var1
                    br $label17
                  end $label16
                  local.get $var6
                  i32.load offset=8
                  local.set $var1
                end $label17
                local.get $var6
                local.get $var3
                i32.store offset=8
                local.get $var1
                local.get $var3
                i32.store offset=12
                local.get $var3
                local.get $var6
                i32.store offset=12
                local.get $var3
                local.get $var1
                i32.store offset=8
              end $label15
              i32.const 0
              local.get $var7
              i32.store offset=1049004
              i32.const 0
              local.get $var2
              i32.store offset=1048996
              local.get $var0
              i32.const 8
              i32.add
              return
            end $label4
            local.get $var0
            i32.ctz
            i32.const 2
            i32.shl
            i32.const 1048580
            i32.add
            i32.load
            local.tee $var6
            i32.load offset=4
            i32.const -8
            i32.and
            local.get $var2
            i32.sub
            local.set $var3
            local.get $var6
            local.set $var1
            block $label23
              block $label25
                loop $label26
                  block $label18
                    local.get $var6
                    i32.load offset=16
                    local.tee $var0
                    br_if $label18
                    local.get $var6
                    i32.load offset=20
                    local.tee $var0
                    br_if $label18
                    local.get $var1
                    i32.load offset=24
                    local.set $var5
                    block $label21
                      block $label20
                        block $label19
                          local.get $var1
                          i32.load offset=12
                          local.tee $var0
                          local.get $var1
                          i32.ne
                          br_if $label19
                          local.get $var1
                          i32.const 20
                          i32.const 16
                          local.get $var1
                          i32.load offset=20
                          local.tee $var0
                          select
                          i32.add
                          i32.load
                          local.tee $var6
                          br_if $label20
                          i32.const 0
                          local.set $var0
                          br $label21
                        end $label19
                        local.get $var1
                        i32.load offset=8
                        local.tee $var6
                        local.get $var0
                        i32.store offset=12
                        local.get $var0
                        local.get $var6
                        i32.store offset=8
                        br $label21
                      end $label20
                      local.get $var1
                      i32.const 20
                      i32.add
                      local.get $var1
                      i32.const 16
                      i32.add
                      local.get $var0
                      select
                      local.set $var7
                      loop $label22
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
                        br_if $label22
                      end $label22
                      local.get $var8
                      i32.const 0
                      i32.store
                    end $label21
                    local.get $var5
                    i32.eqz
                    br_if $label23
                    block $label24
                      local.get $var1
                      i32.load offset=28
                      i32.const 2
                      i32.shl
                      i32.const 1048580
                      i32.add
                      local.tee $var6
                      i32.load
                      local.get $var1
                      i32.eq
                      br_if $label24
                      local.get $var5
                      i32.const 16
                      i32.const 20
                      local.get $var5
                      i32.load offset=16
                      local.get $var1
                      i32.eq
                      select
                      i32.add
                      local.get $var0
                      i32.store
                      local.get $var0
                      i32.eqz
                      br_if $label23
                      br $label25
                    end $label24
                    local.get $var6
                    local.get $var0
                    i32.store
                    local.get $var0
                    br_if $label25
                    i32.const 0
                    i32.const 0
                    i32.load offset=1048992
                    i32.const -2
                    local.get $var1
                    i32.load offset=28
                    i32.rotl
                    i32.and
                    i32.store offset=1048992
                    br $label23
                  end $label18
                  local.get $var0
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get $var2
                  i32.sub
                  local.tee $var6
                  local.get $var3
                  local.get $var6
                  local.get $var3
                  i32.lt_u
                  local.tee $var6
                  select
                  local.set $var3
                  local.get $var0
                  local.get $var1
                  local.get $var6
                  select
                  local.set $var1
                  local.get $var0
                  local.set $var6
                  br $label26
                end $label26
              end $label25
              local.get $var0
              local.get $var5
              i32.store offset=24
              block $label27
                local.get $var1
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
              local.get $var1
              i32.load offset=20
              local.tee $var6
              i32.eqz
              br_if $label23
              local.get $var0
              local.get $var6
              i32.store offset=20
              local.get $var6
              local.get $var0
              i32.store offset=24
            end $label23
            block $label32
              block $label29
                block $label28
                  local.get $var3
                  i32.const 16
                  i32.lt_u
                  br_if $label28
                  local.get $var1
                  local.get $var2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get $var1
                  local.get $var2
                  i32.add
                  local.tee $var2
                  local.get $var3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var2
                  local.get $var3
                  i32.add
                  local.get $var3
                  i32.store
                  i32.const 0
                  i32.load offset=1048996
                  local.tee $var7
                  i32.eqz
                  br_if $label29
                  local.get $var7
                  i32.const -8
                  i32.and
                  i32.const 1048724
                  i32.add
                  local.set $var6
                  i32.const 0
                  i32.load offset=1049004
                  local.set $var0
                  block $label31
                    block $label30
                      i32.const 0
                      i32.load offset=1048988
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
                      i32.store offset=1048988
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
                local.get $var1
                local.get $var3
                local.get $var2
                i32.add
                local.tee $var0
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
                br $label32
              end $label29
              i32.const 0
              local.get $var2
              i32.store offset=1049004
              i32.const 0
              local.get $var3
              i32.store offset=1048996
            end $label32
            local.get $var1
            i32.const 8
            i32.add
            return
          end $label7
          block $label33
            local.get $var0
            local.get $var6
            i32.or
            br_if $label33
            i32.const 0
            local.set $var6
            i32.const 2
            local.get $var5
            i32.shl
            local.tee $var0
            i32.const 0
            local.get $var0
            i32.sub
            i32.or
            local.get $var4
            i32.and
            local.tee $var0
            i32.eqz
            br_if $label2
            local.get $var0
            i32.ctz
            i32.const 2
            i32.shl
            i32.const 1048580
            i32.add
            i32.load
            local.set $var0
          end $label33
          local.get $var0
          i32.eqz
          br_if $label34
        end $label9
        loop $label36
          local.get $var0
          local.get $var6
          local.get $var0
          i32.load offset=4
          i32.const -8
          i32.and
          local.tee $var1
          local.get $var2
          i32.sub
          local.tee $var8
          local.get $var3
          i32.lt_u
          local.tee $var5
          select
          local.set $var4
          local.get $var1
          local.get $var2
          i32.lt_u
          local.set $var7
          local.get $var8
          local.get $var3
          local.get $var5
          select
          local.set $var8
          block $label35
            local.get $var0
            i32.load offset=16
            local.tee $var1
            br_if $label35
            local.get $var0
            i32.load offset=20
            local.set $var1
          end $label35
          local.get $var6
          local.get $var4
          local.get $var7
          select
          local.set $var6
          local.get $var3
          local.get $var8
          local.get $var7
          select
          local.set $var3
          local.get $var1
          local.set $var0
          local.get $var1
          br_if $label36
        end $label36
      end $label34
      local.get $var6
      i32.eqz
      br_if $label2
      block $label37
        i32.const 0
        i32.load offset=1048996
        local.tee $var0
        local.get $var2
        i32.lt_u
        br_if $label37
        local.get $var3
        local.get $var0
        local.get $var2
        i32.sub
        i32.ge_u
        br_if $label2
      end $label37
      local.get $var6
      i32.load offset=24
      local.set $var5
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
            local.tee $var1
            br_if $label39
            i32.const 0
            local.set $var0
            br $label40
          end $label38
          local.get $var6
          i32.load offset=8
          local.tee $var1
          local.get $var0
          i32.store offset=12
          local.get $var0
          local.get $var1
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
          local.get $var1
          local.tee $var0
          i32.const 20
          i32.add
          local.get $var0
          i32.const 16
          i32.add
          local.get $var0
          i32.load offset=20
          local.tee $var1
          select
          local.set $var7
          local.get $var0
          i32.const 20
          i32.const 16
          local.get $var1
          select
          i32.add
          i32.load
          local.tee $var1
          br_if $label41
        end $label41
        local.get $var8
        i32.const 0
        i32.store
      end $label40
      block $label42
        local.get $var5
        i32.eqz
        br_if $label42
        block $label44
          block $label43
            local.get $var6
            i32.load offset=28
            i32.const 2
            i32.shl
            i32.const 1048580
            i32.add
            local.tee $var1
            i32.load
            local.get $var6
            i32.eq
            br_if $label43
            local.get $var5
            i32.const 16
            i32.const 20
            local.get $var5
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
          local.get $var1
          local.get $var0
          i32.store
          local.get $var0
          br_if $label44
          i32.const 0
          i32.const 0
          i32.load offset=1048992
          i32.const -2
          local.get $var6
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1048992
          br $label42
        end $label44
        local.get $var0
        local.get $var5
        i32.store offset=24
        block $label45
          local.get $var6
          i32.load offset=16
          local.tee $var1
          i32.eqz
          br_if $label45
          local.get $var0
          local.get $var1
          i32.store offset=16
          local.get $var1
          local.get $var0
          i32.store offset=24
        end $label45
        local.get $var6
        i32.load offset=20
        local.tee $var1
        i32.eqz
        br_if $label42
        local.get $var0
        local.get $var1
        i32.store offset=20
        local.get $var1
        local.get $var0
        i32.store offset=24
      end $label42
      block $label48
        block $label46
          local.get $var3
          i32.const 16
          i32.lt_u
          br_if $label46
          local.get $var6
          local.get $var2
          i32.const 3
          i32.or
          i32.store offset=4
          local.get $var6
          local.get $var2
          i32.add
          local.tee $var0
          local.get $var3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var0
          local.get $var3
          i32.add
          local.get $var3
          i32.store
          block $label47
            local.get $var3
            i32.const 256
            i32.lt_u
            br_if $label47
            local.get $var0
            local.get $var3
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hefe851a27582da7bE
            br $label48
          end $label47
          local.get $var3
          i32.const 248
          i32.and
          i32.const 1048724
          i32.add
          local.set $var2
          block $label50
            block $label49
              i32.const 0
              i32.load offset=1048988
              local.tee $var1
              i32.const 1
              local.get $var3
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee $var3
              i32.and
              br_if $label49
              i32.const 0
              local.get $var1
              local.get $var3
              i32.or
              i32.store offset=1048988
              local.get $var2
              local.set $var3
              br $label50
            end $label49
            local.get $var2
            i32.load offset=8
            local.set $var3
          end $label50
          local.get $var2
          local.get $var0
          i32.store offset=8
          local.get $var3
          local.get $var0
          i32.store offset=12
          local.get $var0
          local.get $var2
          i32.store offset=12
          local.get $var0
          local.get $var3
          i32.store offset=8
          br $label48
        end $label46
        local.get $var6
        local.get $var3
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
      end $label48
      local.get $var6
      i32.const 8
      i32.add
      return
    end $label2
    block $label53
      block $label60
        block $label77
          block $label74
            block $label73
              block $label61
                block $label51
                  i32.const 0
                  i32.load offset=1048996
                  local.tee $var0
                  local.get $var2
                  i32.ge_u
                  br_if $label51
                  block $label52
                    i32.const 0
                    i32.load offset=1049000
                    local.tee $var0
                    local.get $var2
                    i32.gt_u
                    br_if $label52
                    i32.const 0
                    local.set $var0
                    local.get $var2
                    i32.const 65583
                    i32.add
                    local.tee $var6
                    i32.const 16
                    i32.shr_u
                    memory.grow
                    local.tee $var3
                    i32.const -1
                    i32.eq
                    local.tee $var7
                    br_if $label53
                    local.get $var3
                    i32.const 16
                    i32.shl
                    local.tee $var1
                    i32.eqz
                    br_if $label53
                    i32.const 0
                    i32.const 0
                    i32.load offset=1049012
                    i32.const 0
                    local.get $var6
                    i32.const -65536
                    i32.and
                    local.get $var7
                    select
                    local.tee $var8
                    i32.add
                    local.tee $var0
                    i32.store offset=1049012
                    i32.const 0
                    i32.const 0
                    i32.load offset=1049016
                    local.tee $var3
                    local.get $var0
                    local.get $var3
                    local.get $var0
                    i32.gt_u
                    select
                    i32.store offset=1049016
                    block $label57
                      block $label55
                        block $label54
                          i32.const 0
                          i32.load offset=1049008
                          local.tee $var3
                          i32.eqz
                          br_if $label54
                          i32.const 1048708
                          local.set $var0
                          loop $label56
                            local.get $var0
                            i32.load
                            local.tee $var6
                            local.get $var0
                            i32.load offset=4
                            local.tee $var7
                            i32.add
                            local.get $var1
                            i32.eq
                            br_if $label55
                            local.get $var0
                            i32.load offset=8
                            local.tee $var0
                            br_if $label56
                            br $label57
                          end $label56
                        end $label54
                        block $label59
                          block $label58
                            i32.const 0
                            i32.load offset=1049024
                            local.tee $var0
                            i32.eqz
                            br_if $label58
                            local.get $var0
                            local.get $var1
                            i32.le_u
                            br_if $label59
                          end $label58
                          i32.const 0
                          local.get $var1
                          i32.store offset=1049024
                        end $label59
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1049028
                        i32.const 0
                        local.get $var8
                        i32.store offset=1048712
                        i32.const 0
                        local.get $var1
                        i32.store offset=1048708
                        i32.const 0
                        i32.const 1048724
                        i32.store offset=1048736
                        i32.const 0
                        i32.const 1048732
                        i32.store offset=1048744
                        i32.const 0
                        i32.const 1048724
                        i32.store offset=1048732
                        i32.const 0
                        i32.const 1048740
                        i32.store offset=1048752
                        i32.const 0
                        i32.const 1048732
                        i32.store offset=1048740
                        i32.const 0
                        i32.const 1048748
                        i32.store offset=1048760
                        i32.const 0
                        i32.const 1048740
                        i32.store offset=1048748
                        i32.const 0
                        i32.const 1048756
                        i32.store offset=1048768
                        i32.const 0
                        i32.const 1048748
                        i32.store offset=1048756
                        i32.const 0
                        i32.const 1048764
                        i32.store offset=1048776
                        i32.const 0
                        i32.const 1048756
                        i32.store offset=1048764
                        i32.const 0
                        i32.const 1048772
                        i32.store offset=1048784
                        i32.const 0
                        i32.const 1048764
                        i32.store offset=1048772
                        i32.const 0
                        i32.const 1048780
                        i32.store offset=1048792
                        i32.const 0
                        i32.const 1048772
                        i32.store offset=1048780
                        i32.const 0
                        i32.const 0
                        i32.store offset=1048720
                        i32.const 0
                        i32.const 1048788
                        i32.store offset=1048800
                        i32.const 0
                        i32.const 1048780
                        i32.store offset=1048788
                        i32.const 0
                        i32.const 1048788
                        i32.store offset=1048796
                        i32.const 0
                        i32.const 1048796
                        i32.store offset=1048808
                        i32.const 0
                        i32.const 1048796
                        i32.store offset=1048804
                        i32.const 0
                        i32.const 1048804
                        i32.store offset=1048816
                        i32.const 0
                        i32.const 1048804
                        i32.store offset=1048812
                        i32.const 0
                        i32.const 1048812
                        i32.store offset=1048824
                        i32.const 0
                        i32.const 1048812
                        i32.store offset=1048820
                        i32.const 0
                        i32.const 1048820
                        i32.store offset=1048832
                        i32.const 0
                        i32.const 1048820
                        i32.store offset=1048828
                        i32.const 0
                        i32.const 1048828
                        i32.store offset=1048840
                        i32.const 0
                        i32.const 1048828
                        i32.store offset=1048836
                        i32.const 0
                        i32.const 1048836
                        i32.store offset=1048848
                        i32.const 0
                        i32.const 1048836
                        i32.store offset=1048844
                        i32.const 0
                        i32.const 1048844
                        i32.store offset=1048856
                        i32.const 0
                        i32.const 1048844
                        i32.store offset=1048852
                        i32.const 0
                        i32.const 1048852
                        i32.store offset=1048864
                        i32.const 0
                        i32.const 1048860
                        i32.store offset=1048872
                        i32.const 0
                        i32.const 1048852
                        i32.store offset=1048860
                        i32.const 0
                        i32.const 1048868
                        i32.store offset=1048880
                        i32.const 0
                        i32.const 1048860
                        i32.store offset=1048868
                        i32.const 0
                        i32.const 1048876
                        i32.store offset=1048888
                        i32.const 0
                        i32.const 1048868
                        i32.store offset=1048876
                        i32.const 0
                        i32.const 1048884
                        i32.store offset=1048896
                        i32.const 0
                        i32.const 1048876
                        i32.store offset=1048884
                        i32.const 0
                        i32.const 1048892
                        i32.store offset=1048904
                        i32.const 0
                        i32.const 1048884
                        i32.store offset=1048892
                        i32.const 0
                        i32.const 1048900
                        i32.store offset=1048912
                        i32.const 0
                        i32.const 1048892
                        i32.store offset=1048900
                        i32.const 0
                        i32.const 1048908
                        i32.store offset=1048920
                        i32.const 0
                        i32.const 1048900
                        i32.store offset=1048908
                        i32.const 0
                        i32.const 1048916
                        i32.store offset=1048928
                        i32.const 0
                        i32.const 1048908
                        i32.store offset=1048916
                        i32.const 0
                        i32.const 1048924
                        i32.store offset=1048936
                        i32.const 0
                        i32.const 1048916
                        i32.store offset=1048924
                        i32.const 0
                        i32.const 1048932
                        i32.store offset=1048944
                        i32.const 0
                        i32.const 1048924
                        i32.store offset=1048932
                        i32.const 0
                        i32.const 1048940
                        i32.store offset=1048952
                        i32.const 0
                        i32.const 1048932
                        i32.store offset=1048940
                        i32.const 0
                        i32.const 1048948
                        i32.store offset=1048960
                        i32.const 0
                        i32.const 1048940
                        i32.store offset=1048948
                        i32.const 0
                        i32.const 1048956
                        i32.store offset=1048968
                        i32.const 0
                        i32.const 1048948
                        i32.store offset=1048956
                        i32.const 0
                        i32.const 1048964
                        i32.store offset=1048976
                        i32.const 0
                        i32.const 1048956
                        i32.store offset=1048964
                        i32.const 0
                        i32.const 1048972
                        i32.store offset=1048984
                        i32.const 0
                        i32.const 1048964
                        i32.store offset=1048972
                        i32.const 0
                        local.get $var1
                        i32.store offset=1049008
                        i32.const 0
                        i32.const 1048972
                        i32.store offset=1048980
                        i32.const 0
                        local.get $var8
                        i32.const -40
                        i32.add
                        local.tee $var0
                        i32.store offset=1049000
                        local.get $var1
                        local.get $var0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get $var1
                        local.get $var0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 2097152
                        i32.store offset=1049020
                        br $label60
                      end $label55
                      local.get $var3
                      local.get $var1
                      i32.ge_u
                      br_if $label57
                      local.get $var6
                      local.get $var3
                      i32.gt_u
                      br_if $label57
                      local.get $var0
                      i32.load offset=12
                      i32.eqz
                      br_if $label61
                    end $label57
                    i32.const 0
                    i32.const 0
                    i32.load offset=1049024
                    local.tee $var0
                    local.get $var1
                    local.get $var0
                    local.get $var1
                    i32.lt_u
                    select
                    i32.store offset=1049024
                    local.get $var1
                    local.get $var8
                    i32.add
                    local.set $var6
                    i32.const 1048708
                    local.set $var0
                    block $label65
                      block $label64
                        block $label62
                          loop $label63
                            local.get $var0
                            i32.load
                            local.tee $var7
                            local.get $var6
                            i32.eq
                            br_if $label62
                            local.get $var0
                            i32.load offset=8
                            local.tee $var0
                            br_if $label63
                            br $label64
                          end $label63
                        end $label62
                        local.get $var0
                        i32.load offset=12
                        i32.eqz
                        br_if $label65
                      end $label64
                      i32.const 1048708
                      local.set $var0
                      block $label67
                        loop $label68
                          block $label66
                            local.get $var0
                            i32.load
                            local.tee $var6
                            local.get $var3
                            i32.gt_u
                            br_if $label66
                            local.get $var3
                            local.get $var6
                            local.get $var0
                            i32.load offset=4
                            i32.add
                            local.tee $var6
                            i32.lt_u
                            br_if $label67
                          end $label66
                          local.get $var0
                          i32.load offset=8
                          local.set $var0
                          br $label68
                        end $label68
                      end $label67
                      i32.const 0
                      local.get $var1
                      i32.store offset=1049008
                      i32.const 0
                      local.get $var8
                      i32.const -40
                      i32.add
                      local.tee $var0
                      i32.store offset=1049000
                      local.get $var1
                      local.get $var0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var1
                      local.get $var0
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 0
                      i32.const 2097152
                      i32.store offset=1049020
                      local.get $var3
                      local.get $var6
                      i32.const -32
                      i32.add
                      i32.const -8
                      i32.and
                      i32.const -8
                      i32.add
                      local.tee $var0
                      local.get $var0
                      local.get $var3
                      i32.const 16
                      i32.add
                      i32.lt_u
                      select
                      local.tee $var7
                      i32.const 27
                      i32.store offset=4
                      i32.const 0
                      i64.load offset=1048708 align=4
                      local.set $var9
                      local.get $var7
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1048716 align=4
                      i64.store align=4
                      local.get $var7
                      local.get $var9
                      i64.store offset=8 align=4
                      i32.const 0
                      local.get $var8
                      i32.store offset=1048712
                      i32.const 0
                      local.get $var1
                      i32.store offset=1048708
                      i32.const 0
                      local.get $var7
                      i32.const 8
                      i32.add
                      i32.store offset=1048716
                      i32.const 0
                      i32.const 0
                      i32.store offset=1048720
                      local.get $var7
                      i32.const 28
                      i32.add
                      local.set $var0
                      loop $label69
                        local.get $var0
                        i32.const 7
                        i32.store
                        local.get $var0
                        i32.const 4
                        i32.add
                        local.tee $var0
                        local.get $var6
                        i32.lt_u
                        br_if $label69
                      end $label69
                      local.get $var7
                      local.get $var3
                      i32.eq
                      br_if $label60
                      local.get $var7
                      local.get $var7
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get $var3
                      local.get $var7
                      local.get $var3
                      i32.sub
                      local.tee $var0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var7
                      local.get $var0
                      i32.store
                      block $label70
                        local.get $var0
                        i32.const 256
                        i32.lt_u
                        br_if $label70
                        local.get $var3
                        local.get $var0
                        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hefe851a27582da7bE
                        br $label60
                      end $label70
                      local.get $var0
                      i32.const 248
                      i32.and
                      i32.const 1048724
                      i32.add
                      local.set $var6
                      block $label72
                        block $label71
                          i32.const 0
                          i32.load offset=1048988
                          local.tee $var1
                          i32.const 1
                          local.get $var0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee $var0
                          i32.and
                          br_if $label71
                          i32.const 0
                          local.get $var1
                          local.get $var0
                          i32.or
                          i32.store offset=1048988
                          local.get $var6
                          local.set $var0
                          br $label72
                        end $label71
                        local.get $var6
                        i32.load offset=8
                        local.set $var0
                      end $label72
                      local.get $var6
                      local.get $var3
                      i32.store offset=8
                      local.get $var0
                      local.get $var3
                      i32.store offset=12
                      local.get $var3
                      local.get $var6
                      i32.store offset=12
                      local.get $var3
                      local.get $var0
                      i32.store offset=8
                      br $label60
                    end $label65
                    local.get $var0
                    local.get $var1
                    i32.store
                    local.get $var0
                    local.get $var0
                    i32.load offset=4
                    local.get $var8
                    i32.add
                    i32.store offset=4
                    local.get $var1
                    local.get $var2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $var7
                    i32.const 15
                    i32.add
                    i32.const -8
                    i32.and
                    i32.const -8
                    i32.add
                    local.tee $var6
                    local.get $var1
                    local.get $var2
                    i32.add
                    local.tee $var0
                    i32.sub
                    local.set $var3
                    local.get $var6
                    i32.const 0
                    i32.load offset=1049008
                    i32.eq
                    br_if $label73
                    local.get $var6
                    i32.const 0
                    i32.load offset=1049004
                    i32.eq
                    br_if $label74
                    block $label75
                      local.get $var6
                      i32.load offset=4
                      local.tee $var2
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.ne
                      br_if $label75
                      local.get $var6
                      local.get $var2
                      i32.const -8
                      i32.and
                      local.tee $var2
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h934e3dc383bb58a3E
                      local.get $var2
                      local.get $var3
                      i32.add
                      local.set $var3
                      local.get $var6
                      local.get $var2
                      i32.add
                      local.tee $var6
                      i32.load offset=4
                      local.set $var2
                    end $label75
                    local.get $var6
                    local.get $var2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get $var0
                    local.get $var3
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get $var0
                    local.get $var3
                    i32.add
                    local.get $var3
                    i32.store
                    block $label76
                      local.get $var3
                      i32.const 256
                      i32.lt_u
                      br_if $label76
                      local.get $var0
                      local.get $var3
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hefe851a27582da7bE
                      br $label77
                    end $label76
                    local.get $var3
                    i32.const 248
                    i32.and
                    i32.const 1048724
                    i32.add
                    local.set $var2
                    block $label79
                      block $label78
                        i32.const 0
                        i32.load offset=1048988
                        local.tee $var6
                        i32.const 1
                        local.get $var3
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee $var3
                        i32.and
                        br_if $label78
                        i32.const 0
                        local.get $var6
                        local.get $var3
                        i32.or
                        i32.store offset=1048988
                        local.get $var2
                        local.set $var3
                        br $label79
                      end $label78
                      local.get $var2
                      i32.load offset=8
                      local.set $var3
                    end $label79
                    local.get $var2
                    local.get $var0
                    i32.store offset=8
                    local.get $var3
                    local.get $var0
                    i32.store offset=12
                    local.get $var0
                    local.get $var2
                    i32.store offset=12
                    local.get $var0
                    local.get $var3
                    i32.store offset=8
                    br $label77
                  end $label52
                  i32.const 0
                  local.get $var0
                  local.get $var2
                  i32.sub
                  local.tee $var3
                  i32.store offset=1049000
                  i32.const 0
                  i32.const 0
                  i32.load offset=1049008
                  local.tee $var0
                  local.get $var2
                  i32.add
                  local.tee $var6
                  i32.store offset=1049008
                  local.get $var6
                  local.get $var3
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
                  local.set $var0
                  br $label53
                end $label51
                i32.const 0
                i32.load offset=1049004
                local.set $var3
                block $label81
                  block $label80
                    local.get $var0
                    local.get $var2
                    i32.sub
                    local.tee $var6
                    i32.const 15
                    i32.gt_u
                    br_if $label80
                    i32.const 0
                    i32.const 0
                    i32.store offset=1049004
                    i32.const 0
                    i32.const 0
                    i32.store offset=1048996
                    local.get $var3
                    local.get $var0
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $var3
                    local.get $var0
                    i32.add
                    local.tee $var0
                    local.get $var0
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br $label81
                  end $label80
                  i32.const 0
                  local.get $var6
                  i32.store offset=1048996
                  i32.const 0
                  local.get $var3
                  local.get $var2
                  i32.add
                  local.tee $var1
                  i32.store offset=1049004
                  local.get $var1
                  local.get $var6
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var3
                  local.get $var0
                  i32.add
                  local.get $var6
                  i32.store
                  local.get $var3
                  local.get $var2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                end $label81
                local.get $var3
                i32.const 8
                i32.add
                return
              end $label61
              local.get $var0
              local.get $var7
              local.get $var8
              i32.add
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=1049008
              local.tee $var0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee $var3
              i32.const -8
              i32.add
              local.tee $var6
              i32.store offset=1049008
              i32.const 0
              local.get $var0
              local.get $var3
              i32.sub
              i32.const 0
              i32.load offset=1049000
              local.get $var8
              i32.add
              local.tee $var3
              i32.add
              i32.const 8
              i32.add
              local.tee $var1
              i32.store offset=1049000
              local.get $var6
              local.get $var1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var3
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 0
              i32.const 2097152
              i32.store offset=1049020
              br $label60
            end $label73
            i32.const 0
            local.get $var0
            i32.store offset=1049008
            i32.const 0
            i32.const 0
            i32.load offset=1049000
            local.get $var3
            i32.add
            local.tee $var3
            i32.store offset=1049000
            local.get $var0
            local.get $var3
            i32.const 1
            i32.or
            i32.store offset=4
            br $label77
          end $label74
          i32.const 0
          local.get $var0
          i32.store offset=1049004
          i32.const 0
          i32.const 0
          i32.load offset=1048996
          local.get $var3
          i32.add
          local.tee $var3
          i32.store offset=1048996
          local.get $var0
          local.get $var3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var0
          local.get $var3
          i32.add
          local.get $var3
          i32.store
        end $label77
        local.get $var1
        i32.const 8
        i32.add
        return
      end $label60
      i32.const 0
      local.set $var0
      i32.const 0
      i32.load offset=1049000
      local.tee $var3
      local.get $var2
      i32.le_u
      br_if $label53
      i32.const 0
      local.get $var3
      local.get $var2
      i32.sub
      local.tee $var3
      i32.store offset=1049000
      i32.const 0
      i32.const 0
      i32.load offset=1049008
      local.tee $var0
      local.get $var2
      i32.add
      local.tee $var6
      i32.store offset=1049008
      local.get $var6
      local.get $var3
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
    end $label53
    local.get $var0
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17hefe851a27582da7bE (;2;) (param $var0 i32) (param $var1 i32)
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
    i32.const 1048580
    i32.add
    local.set $var3
    block $label1
      i32.const 0
      i32.load offset=1048992
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
      i32.load offset=1048992
      local.get $var4
      i32.or
      i32.store offset=1048992
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
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h934e3dc383bb58a3E (;3;) (param $var0 i32) (param $var1 i32)
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
            i32.const 1048580
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
          i32.load offset=1048992
          i32.const -2
          local.get $var0
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1048992
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
        i32.load offset=1048988
        i32.const -2
        local.get $var1
        i32.const 3
        i32.shr_u
        i32.rotl
        i32.and
        i32.store offset=1048988
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
)