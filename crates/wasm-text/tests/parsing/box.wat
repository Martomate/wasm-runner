(module $box-132512f5f507a254.wasm
  (table $table0 1 1 funcref)
  (memory $memory (;0;) (export "memory") 17)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1049028))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1049040))
  (func $calc (;0;) (export "calc") (param $var0 i32) (result i32)
    (local $var1 i32)
    block $label0
      i32.const 4
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE
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
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE (;1;) (param $var0 i32) (result i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i64)
    block $label28
      block $label2
        block $label0
          local.get $var0
          i32.const 244
          i32.gt_u
          br_if $label0
          block $label9
            block $label13
              block $label3
                block $label1
                  i32.const 0
                  i32.load offset=1048984
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
                  i32.load offset=1048992
                  i32.le_u
                  br_if $label2
                  local.get $var0
                  br_if $label3
                  i32.const 0
                  i32.load offset=1048988
                  local.tee $var0
                  i32.eqz
                  br_if $label2
                  local.get $var0
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.const 1048576
                  i32.add
                  i32.load
                  local.tee $var4
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get $var2
                  i32.sub
                  local.set $var3
                  local.get $var4
                  local.set $var1
                  loop $label15
                    block $label4
                      local.get $var4
                      i32.load offset=16
                      local.tee $var0
                      br_if $label4
                      local.get $var4
                      i32.load offset=20
                      local.tee $var0
                      br_if $label4
                      local.get $var1
                      i32.load offset=24
                      local.set $var5
                      block $label7
                        block $label6
                          block $label5
                            local.get $var1
                            i32.load offset=12
                            local.tee $var0
                            local.get $var1
                            i32.ne
                            br_if $label5
                            local.get $var1
                            i32.const 20
                            i32.const 16
                            local.get $var1
                            i32.load offset=20
                            local.tee $var0
                            select
                            i32.add
                            i32.load
                            local.tee $var4
                            br_if $label6
                            i32.const 0
                            local.set $var0
                            br $label7
                          end $label5
                          local.get $var1
                          i32.load offset=8
                          local.tee $var4
                          local.get $var0
                          i32.store offset=12
                          local.get $var0
                          local.get $var4
                          i32.store offset=8
                          br $label7
                        end $label6
                        local.get $var1
                        i32.const 20
                        i32.add
                        local.get $var1
                        i32.const 16
                        i32.add
                        local.get $var0
                        select
                        local.set $var6
                        loop $label8
                          local.get $var6
                          local.set $var7
                          local.get $var4
                          local.tee $var0
                          i32.const 20
                          i32.add
                          local.get $var0
                          i32.const 16
                          i32.add
                          local.get $var0
                          i32.load offset=20
                          local.tee $var4
                          select
                          local.set $var6
                          local.get $var0
                          i32.const 20
                          i32.const 16
                          local.get $var4
                          select
                          i32.add
                          i32.load
                          local.tee $var4
                          br_if $label8
                        end $label8
                        local.get $var7
                        i32.const 0
                        i32.store
                      end $label7
                      local.get $var5
                      i32.eqz
                      br_if $label9
                      block $label12
                        block $label10
                          local.get $var1
                          local.get $var1
                          i32.load offset=28
                          i32.const 2
                          i32.shl
                          i32.const 1048576
                          i32.add
                          local.tee $var4
                          i32.load
                          i32.eq
                          br_if $label10
                          block $label11
                            local.get $var5
                            i32.load offset=16
                            local.get $var1
                            i32.eq
                            br_if $label11
                            local.get $var5
                            local.get $var0
                            i32.store offset=20
                            local.get $var0
                            br_if $label12
                            br $label9
                          end $label11
                          local.get $var5
                          local.get $var0
                          i32.store offset=16
                          local.get $var0
                          br_if $label12
                          br $label9
                        end $label10
                        local.get $var4
                        local.get $var0
                        i32.store
                        local.get $var0
                        i32.eqz
                        br_if $label13
                      end $label12
                      local.get $var0
                      local.get $var5
                      i32.store offset=24
                      block $label14
                        local.get $var1
                        i32.load offset=16
                        local.tee $var4
                        i32.eqz
                        br_if $label14
                        local.get $var0
                        local.get $var4
                        i32.store offset=16
                        local.get $var4
                        local.get $var0
                        i32.store offset=24
                      end $label14
                      local.get $var1
                      i32.load offset=20
                      local.tee $var4
                      i32.eqz
                      br_if $label9
                      local.get $var0
                      local.get $var4
                      i32.store offset=20
                      local.get $var4
                      local.get $var0
                      i32.store offset=24
                      br $label9
                    end $label4
                    local.get $var0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get $var2
                    i32.sub
                    local.tee $var4
                    local.get $var3
                    local.get $var4
                    local.get $var3
                    i32.lt_u
                    local.tee $var4
                    select
                    local.set $var3
                    local.get $var0
                    local.get $var1
                    local.get $var4
                    select
                    local.set $var1
                    local.get $var0
                    local.set $var4
                    br $label15
                  end $label15
                end $label1
                block $label17
                  block $label16
                    local.get $var0
                    i32.const -1
                    i32.xor
                    i32.const 1
                    i32.and
                    local.get $var3
                    i32.add
                    local.tee $var6
                    i32.const 3
                    i32.shl
                    local.tee $var0
                    i32.const 1048720
                    i32.add
                    local.tee $var2
                    local.get $var0
                    i32.const 1048728
                    i32.add
                    i32.load
                    local.tee $var3
                    i32.load offset=8
                    local.tee $var4
                    i32.eq
                    br_if $label16
                    local.get $var4
                    local.get $var2
                    i32.store offset=12
                    local.get $var2
                    local.get $var4
                    i32.store offset=8
                    br $label17
                  end $label16
                  i32.const 0
                  local.get $var1
                  i32.const -2
                  local.get $var6
                  i32.rotl
                  i32.and
                  i32.store offset=1048984
                end $label17
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
              block $label19
                block $label18
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
                  local.tee $var7
                  i32.const 3
                  i32.shl
                  local.tee $var3
                  i32.const 1048720
                  i32.add
                  local.tee $var4
                  local.get $var3
                  i32.const 1048728
                  i32.add
                  i32.load
                  local.tee $var0
                  i32.load offset=8
                  local.tee $var6
                  i32.eq
                  br_if $label18
                  local.get $var6
                  local.get $var4
                  i32.store offset=12
                  local.get $var4
                  local.get $var6
                  i32.store offset=8
                  br $label19
                end $label18
                i32.const 0
                local.get $var1
                i32.const -2
                local.get $var7
                i32.rotl
                i32.and
                i32.store offset=1048984
              end $label19
              local.get $var0
              local.get $var2
              i32.const 3
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var2
              i32.add
              local.tee $var1
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
              block $label20
                i32.const 0
                i32.load offset=1048992
                local.tee $var4
                i32.eqz
                br_if $label20
                i32.const 0
                i32.load offset=1049000
                local.set $var3
                block $label22
                  block $label21
                    i32.const 0
                    i32.load offset=1048984
                    local.tee $var6
                    i32.const 1
                    local.get $var4
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee $var7
                    i32.and
                    br_if $label21
                    i32.const 0
                    local.get $var6
                    local.get $var7
                    i32.or
                    i32.store offset=1048984
                    local.get $var4
                    i32.const -8
                    i32.and
                    i32.const 1048720
                    i32.add
                    local.tee $var4
                    local.set $var6
                    br $label22
                  end $label21
                  local.get $var4
                  i32.const -8
                  i32.and
                  local.tee $var6
                  i32.const 1048720
                  i32.add
                  local.set $var4
                  local.get $var6
                  i32.const 1048728
                  i32.add
                  i32.load
                  local.set $var6
                end $label22
                local.get $var4
                local.get $var3
                i32.store offset=8
                local.get $var6
                local.get $var3
                i32.store offset=12
                local.get $var3
                local.get $var4
                i32.store offset=12
                local.get $var3
                local.get $var6
                i32.store offset=8
              end $label20
              i32.const 0
              local.get $var1
              i32.store offset=1049000
              i32.const 0
              local.get $var2
              i32.store offset=1048992
              local.get $var0
              i32.const 8
              i32.add
              return
            end $label13
            i32.const 0
            i32.const 0
            i32.load offset=1048988
            i32.const -2
            local.get $var1
            i32.load offset=28
            i32.rotl
            i32.and
            i32.store offset=1048988
          end $label9
          block $label27
            block $label24
              block $label23
                local.get $var3
                i32.const 16
                i32.lt_u
                br_if $label23
                local.get $var1
                local.get $var2
                i32.const 3
                i32.or
                i32.store offset=4
                local.get $var1
                local.get $var2
                i32.add
                local.tee $var4
                local.get $var3
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $var4
                local.get $var3
                i32.add
                local.get $var3
                i32.store
                i32.const 0
                i32.load offset=1048992
                local.tee $var6
                i32.eqz
                br_if $label24
                i32.const 0
                i32.load offset=1049000
                local.set $var0
                block $label26
                  block $label25
                    i32.const 0
                    i32.load offset=1048984
                    local.tee $var7
                    i32.const 1
                    local.get $var6
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee $var5
                    i32.and
                    br_if $label25
                    i32.const 0
                    local.get $var7
                    local.get $var5
                    i32.or
                    i32.store offset=1048984
                    local.get $var6
                    i32.const -8
                    i32.and
                    i32.const 1048720
                    i32.add
                    local.tee $var6
                    local.set $var7
                    br $label26
                  end $label25
                  local.get $var6
                  i32.const -8
                  i32.and
                  local.tee $var7
                  i32.const 1048720
                  i32.add
                  local.set $var6
                  local.get $var7
                  i32.const 1048728
                  i32.add
                  i32.load
                  local.set $var7
                end $label26
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
                br $label24
              end $label23
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
              br $label27
            end $label24
            i32.const 0
            local.get $var4
            i32.store offset=1049000
            i32.const 0
            local.get $var3
            i32.store offset=1048992
          end $label27
          local.get $var1
          i32.const 8
          i32.add
          local.tee $var0
          i32.eqz
          br_if $label2
          br $label28
        end $label0
        local.get $var0
        i32.const 11
        i32.add
        local.tee $var3
        i32.const -8
        i32.and
        local.set $var2
        i32.const 0
        i32.load offset=1048988
        local.tee $var8
        i32.eqz
        br_if $label2
        i32.const 31
        local.set $var5
        block $label29
          local.get $var0
          i32.const 16777204
          i32.gt_u
          br_if $label29
          local.get $var2
          i32.const 38
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
        end $label29
        i32.const 0
        local.get $var2
        i32.sub
        local.set $var3
        block $label36
          block $label33
            block $label31
              block $label30
                local.get $var5
                i32.const 2
                i32.shl
                i32.const 1048576
                i32.add
                i32.load
                local.tee $var1
                br_if $label30
                i32.const 0
                local.set $var0
                i32.const 0
                local.set $var4
                br $label31
              end $label30
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
              local.set $var6
              i32.const 0
              local.set $var4
              loop $label34
                block $label32
                  local.get $var1
                  local.tee $var1
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.tee $var7
                  local.get $var2
                  i32.lt_u
                  br_if $label32
                  local.get $var7
                  local.get $var2
                  i32.sub
                  local.tee $var7
                  local.get $var3
                  i32.ge_u
                  br_if $label32
                  local.get $var7
                  local.set $var3
                  local.get $var1
                  local.set $var4
                  local.get $var7
                  br_if $label32
                  i32.const 0
                  local.set $var3
                  local.get $var1
                  local.set $var4
                  local.get $var1
                  local.set $var0
                  br $label33
                end $label32
                local.get $var1
                i32.load offset=20
                local.tee $var7
                local.get $var0
                local.get $var7
                local.get $var1
                local.get $var6
                i32.const 29
                i32.shr_u
                i32.const 4
                i32.and
                i32.add
                i32.load offset=16
                local.tee $var1
                i32.ne
                select
                local.get $var0
                local.get $var7
                select
                local.set $var0
                local.get $var6
                i32.const 1
                i32.shl
                local.set $var6
                local.get $var1
                br_if $label34
              end $label34
            end $label31
            block $label35
              local.get $var0
              local.get $var4
              i32.or
              br_if $label35
              i32.const 0
              local.set $var4
              i32.const 2
              local.get $var5
              i32.shl
              local.tee $var0
              i32.const 0
              local.get $var0
              i32.sub
              i32.or
              local.get $var8
              i32.and
              local.tee $var0
              i32.eqz
              br_if $label2
              local.get $var0
              i32.ctz
              i32.const 2
              i32.shl
              i32.const 1048576
              i32.add
              i32.load
              local.set $var0
            end $label35
            local.get $var0
            i32.eqz
            br_if $label36
          end $label33
          loop $label38
            local.get $var0
            local.get $var4
            local.get $var0
            i32.load offset=4
            i32.const -8
            i32.and
            local.tee $var1
            local.get $var2
            i32.sub
            local.tee $var7
            local.get $var3
            i32.lt_u
            local.tee $var5
            select
            local.set $var8
            local.get $var1
            local.get $var2
            i32.lt_u
            local.set $var6
            local.get $var7
            local.get $var3
            local.get $var5
            select
            local.set $var7
            block $label37
              local.get $var0
              i32.load offset=16
              local.tee $var1
              br_if $label37
              local.get $var0
              i32.load offset=20
              local.set $var1
            end $label37
            local.get $var4
            local.get $var8
            local.get $var6
            select
            local.set $var4
            local.get $var3
            local.get $var7
            local.get $var6
            select
            local.set $var3
            local.get $var1
            local.set $var0
            local.get $var1
            br_if $label38
          end $label38
        end $label36
        local.get $var4
        i32.eqz
        br_if $label2
        block $label39
          i32.const 0
          i32.load offset=1048992
          local.tee $var0
          local.get $var2
          i32.lt_u
          br_if $label39
          local.get $var3
          local.get $var0
          local.get $var2
          i32.sub
          i32.ge_u
          br_if $label2
        end $label39
        local.get $var4
        i32.load offset=24
        local.set $var5
        block $label42
          block $label41
            block $label40
              local.get $var4
              i32.load offset=12
              local.tee $var0
              local.get $var4
              i32.ne
              br_if $label40
              local.get $var4
              i32.const 20
              i32.const 16
              local.get $var4
              i32.load offset=20
              local.tee $var0
              select
              i32.add
              i32.load
              local.tee $var1
              br_if $label41
              i32.const 0
              local.set $var0
              br $label42
            end $label40
            local.get $var4
            i32.load offset=8
            local.tee $var1
            local.get $var0
            i32.store offset=12
            local.get $var0
            local.get $var1
            i32.store offset=8
            br $label42
          end $label41
          local.get $var4
          i32.const 20
          i32.add
          local.get $var4
          i32.const 16
          i32.add
          local.get $var0
          select
          local.set $var6
          loop $label43
            local.get $var6
            local.set $var7
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
            local.set $var6
            local.get $var0
            i32.const 20
            i32.const 16
            local.get $var1
            select
            i32.add
            i32.load
            local.tee $var1
            br_if $label43
          end $label43
          local.get $var7
          i32.const 0
          i32.store
        end $label42
        block $label44
          local.get $var5
          i32.eqz
          br_if $label44
          block $label48
            block $label47
              block $label45
                local.get $var4
                local.get $var4
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1048576
                i32.add
                local.tee $var1
                i32.load
                i32.eq
                br_if $label45
                block $label46
                  local.get $var5
                  i32.load offset=16
                  local.get $var4
                  i32.eq
                  br_if $label46
                  local.get $var5
                  local.get $var0
                  i32.store offset=20
                  local.get $var0
                  br_if $label47
                  br $label44
                end $label46
                local.get $var5
                local.get $var0
                i32.store offset=16
                local.get $var0
                br_if $label47
                br $label44
              end $label45
              local.get $var1
              local.get $var0
              i32.store
              local.get $var0
              i32.eqz
              br_if $label48
            end $label47
            local.get $var0
            local.get $var5
            i32.store offset=24
            block $label49
              local.get $var4
              i32.load offset=16
              local.tee $var1
              i32.eqz
              br_if $label49
              local.get $var0
              local.get $var1
              i32.store offset=16
              local.get $var1
              local.get $var0
              i32.store offset=24
            end $label49
            local.get $var4
            i32.load offset=20
            local.tee $var1
            i32.eqz
            br_if $label44
            local.get $var0
            local.get $var1
            i32.store offset=20
            local.get $var1
            local.get $var0
            i32.store offset=24
            br $label44
          end $label48
          i32.const 0
          i32.const 0
          i32.load offset=1048988
          i32.const -2
          local.get $var4
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1048988
        end $label44
        block $label52
          block $label50
            local.get $var3
            i32.const 16
            i32.lt_u
            br_if $label50
            local.get $var4
            local.get $var2
            i32.const 3
            i32.or
            i32.store offset=4
            local.get $var4
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
            block $label51
              local.get $var3
              i32.const 256
              i32.lt_u
              br_if $label51
              local.get $var0
              local.get $var3
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E
              br $label52
            end $label51
            block $label54
              block $label53
                i32.const 0
                i32.load offset=1048984
                local.tee $var1
                i32.const 1
                local.get $var3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee $var6
                i32.and
                br_if $label53
                i32.const 0
                local.get $var1
                local.get $var6
                i32.or
                i32.store offset=1048984
                local.get $var3
                i32.const 248
                i32.and
                i32.const 1048720
                i32.add
                local.tee $var3
                local.set $var1
                br $label54
              end $label53
              local.get $var3
              i32.const 248
              i32.and
              local.tee $var1
              i32.const 1048720
              i32.add
              local.set $var3
              local.get $var1
              i32.const 1048728
              i32.add
              i32.load
              local.set $var1
            end $label54
            local.get $var3
            local.get $var0
            i32.store offset=8
            local.get $var1
            local.get $var0
            i32.store offset=12
            local.get $var0
            local.get $var3
            i32.store offset=12
            local.get $var0
            local.get $var1
            i32.store offset=8
            br $label52
          end $label50
          local.get $var4
          local.get $var3
          local.get $var2
          i32.add
          local.tee $var0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get $var4
          local.get $var0
          i32.add
          local.tee $var0
          local.get $var0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
        end $label52
        local.get $var4
        i32.const 8
        i32.add
        local.tee $var0
        br_if $label28
      end $label2
      block $label64
        block $label81
          block $label78
            block $label77
              block $label65
                block $label55
                  i32.const 0
                  i32.load offset=1048992
                  local.tee $var0
                  local.get $var2
                  i32.ge_u
                  br_if $label55
                  block $label56
                    i32.const 0
                    i32.load offset=1048996
                    local.tee $var0
                    local.get $var2
                    i32.gt_u
                    br_if $label56
                    block $label57
                      local.get $var2
                      i32.const 65583
                      i32.add
                      local.tee $var4
                      i32.const 16
                      i32.shr_u
                      memory.grow
                      local.tee $var3
                      i32.const -1
                      i32.ne
                      br_if $label57
                      i32.const 0
                      return
                    end $label57
                    i32.const 0
                    local.set $var0
                    local.get $var3
                    i32.const 16
                    i32.shl
                    local.tee $var1
                    i32.eqz
                    br_if $label28
                    i32.const 0
                    i32.const 0
                    i32.load offset=1049008
                    local.get $var4
                    i32.const -65536
                    i32.and
                    local.tee $var0
                    i32.const -16
                    i32.add
                    local.get $var0
                    local.get $var1
                    i32.const 0
                    local.get $var0
                    i32.sub
                    i32.eq
                    select
                    local.tee $var7
                    i32.add
                    local.tee $var0
                    i32.store offset=1049008
                    i32.const 0
                    local.get $var0
                    i32.const 0
                    i32.load offset=1049012
                    local.tee $var3
                    local.get $var0
                    local.get $var3
                    i32.gt_u
                    select
                    i32.store offset=1049012
                    block $label61
                      block $label59
                        block $label58
                          i32.const 0
                          i32.load offset=1049004
                          local.tee $var3
                          i32.eqz
                          br_if $label58
                          i32.const 1048704
                          local.set $var0
                          loop $label60
                            local.get $var0
                            i32.load
                            local.tee $var4
                            local.get $var0
                            i32.load offset=4
                            local.tee $var6
                            i32.add
                            local.get $var1
                            i32.eq
                            br_if $label59
                            local.get $var0
                            i32.load offset=8
                            local.tee $var0
                            br_if $label60
                            br $label61
                          end $label60
                        end $label58
                        block $label63
                          block $label62
                            i32.const 0
                            i32.load offset=1049020
                            local.tee $var0
                            i32.eqz
                            br_if $label62
                            local.get $var0
                            local.get $var1
                            i32.le_u
                            br_if $label63
                          end $label62
                          i32.const 0
                          local.get $var1
                          i32.store offset=1049020
                        end $label63
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1049024
                        i32.const 0
                        local.get $var7
                        i32.store offset=1048708
                        i32.const 0
                        local.get $var1
                        i32.store offset=1048704
                        i32.const 0
                        i32.const 1048720
                        i32.store offset=1048732
                        i32.const 0
                        i32.const 1048728
                        i32.store offset=1048740
                        i32.const 0
                        i32.const 1048720
                        i32.store offset=1048728
                        i32.const 0
                        i32.const 1048736
                        i32.store offset=1048748
                        i32.const 0
                        i32.const 1048728
                        i32.store offset=1048736
                        i32.const 0
                        i32.const 1048744
                        i32.store offset=1048756
                        i32.const 0
                        i32.const 1048736
                        i32.store offset=1048744
                        i32.const 0
                        i32.const 1048752
                        i32.store offset=1048764
                        i32.const 0
                        i32.const 1048744
                        i32.store offset=1048752
                        i32.const 0
                        i32.const 1048760
                        i32.store offset=1048772
                        i32.const 0
                        i32.const 1048752
                        i32.store offset=1048760
                        i32.const 0
                        i32.const 1048768
                        i32.store offset=1048780
                        i32.const 0
                        i32.const 1048760
                        i32.store offset=1048768
                        i32.const 0
                        i32.const 1048776
                        i32.store offset=1048788
                        i32.const 0
                        i32.const 1048768
                        i32.store offset=1048776
                        i32.const 0
                        i32.const 0
                        i32.store offset=1048716
                        i32.const 0
                        i32.const 1048784
                        i32.store offset=1048796
                        i32.const 0
                        i32.const 1048776
                        i32.store offset=1048784
                        i32.const 0
                        i32.const 1048784
                        i32.store offset=1048792
                        i32.const 0
                        i32.const 1048792
                        i32.store offset=1048804
                        i32.const 0
                        i32.const 1048792
                        i32.store offset=1048800
                        i32.const 0
                        i32.const 1048800
                        i32.store offset=1048812
                        i32.const 0
                        i32.const 1048800
                        i32.store offset=1048808
                        i32.const 0
                        i32.const 1048808
                        i32.store offset=1048820
                        i32.const 0
                        i32.const 1048808
                        i32.store offset=1048816
                        i32.const 0
                        i32.const 1048816
                        i32.store offset=1048828
                        i32.const 0
                        i32.const 1048816
                        i32.store offset=1048824
                        i32.const 0
                        i32.const 1048824
                        i32.store offset=1048836
                        i32.const 0
                        i32.const 1048824
                        i32.store offset=1048832
                        i32.const 0
                        i32.const 1048832
                        i32.store offset=1048844
                        i32.const 0
                        i32.const 1048832
                        i32.store offset=1048840
                        i32.const 0
                        i32.const 1048840
                        i32.store offset=1048852
                        i32.const 0
                        i32.const 1048840
                        i32.store offset=1048848
                        i32.const 0
                        i32.const 1048848
                        i32.store offset=1048860
                        i32.const 0
                        i32.const 1048856
                        i32.store offset=1048868
                        i32.const 0
                        i32.const 1048848
                        i32.store offset=1048856
                        i32.const 0
                        i32.const 1048864
                        i32.store offset=1048876
                        i32.const 0
                        i32.const 1048856
                        i32.store offset=1048864
                        i32.const 0
                        i32.const 1048872
                        i32.store offset=1048884
                        i32.const 0
                        i32.const 1048864
                        i32.store offset=1048872
                        i32.const 0
                        i32.const 1048880
                        i32.store offset=1048892
                        i32.const 0
                        i32.const 1048872
                        i32.store offset=1048880
                        i32.const 0
                        i32.const 1048888
                        i32.store offset=1048900
                        i32.const 0
                        i32.const 1048880
                        i32.store offset=1048888
                        i32.const 0
                        i32.const 1048896
                        i32.store offset=1048908
                        i32.const 0
                        i32.const 1048888
                        i32.store offset=1048896
                        i32.const 0
                        i32.const 1048904
                        i32.store offset=1048916
                        i32.const 0
                        i32.const 1048896
                        i32.store offset=1048904
                        i32.const 0
                        i32.const 1048912
                        i32.store offset=1048924
                        i32.const 0
                        i32.const 1048904
                        i32.store offset=1048912
                        i32.const 0
                        i32.const 1048920
                        i32.store offset=1048932
                        i32.const 0
                        i32.const 1048912
                        i32.store offset=1048920
                        i32.const 0
                        i32.const 1048928
                        i32.store offset=1048940
                        i32.const 0
                        i32.const 1048920
                        i32.store offset=1048928
                        i32.const 0
                        i32.const 1048936
                        i32.store offset=1048948
                        i32.const 0
                        i32.const 1048928
                        i32.store offset=1048936
                        i32.const 0
                        i32.const 1048944
                        i32.store offset=1048956
                        i32.const 0
                        i32.const 1048936
                        i32.store offset=1048944
                        i32.const 0
                        i32.const 1048952
                        i32.store offset=1048964
                        i32.const 0
                        i32.const 1048944
                        i32.store offset=1048952
                        i32.const 0
                        i32.const 1048960
                        i32.store offset=1048972
                        i32.const 0
                        i32.const 1048952
                        i32.store offset=1048960
                        i32.const 0
                        i32.const 1048968
                        i32.store offset=1048980
                        i32.const 0
                        i32.const 1048960
                        i32.store offset=1048968
                        i32.const 0
                        local.get $var1
                        i32.store offset=1049004
                        i32.const 0
                        i32.const 1048968
                        i32.store offset=1048976
                        i32.const 0
                        local.get $var7
                        i32.const -40
                        i32.add
                        local.tee $var0
                        i32.store offset=1048996
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
                        i32.store offset=1049016
                        br $label64
                      end $label59
                      local.get $var3
                      local.get $var1
                      i32.ge_u
                      br_if $label61
                      local.get $var4
                      local.get $var3
                      i32.gt_u
                      br_if $label61
                      local.get $var0
                      i32.load offset=12
                      i32.eqz
                      br_if $label65
                    end $label61
                    i32.const 0
                    i32.const 0
                    i32.load offset=1049020
                    local.tee $var0
                    local.get $var1
                    local.get $var0
                    local.get $var1
                    i32.lt_u
                    select
                    i32.store offset=1049020
                    local.get $var1
                    local.get $var7
                    i32.add
                    local.set $var4
                    i32.const 1048704
                    local.set $var0
                    block $label69
                      block $label68
                        block $label66
                          loop $label67
                            local.get $var0
                            i32.load
                            local.tee $var6
                            local.get $var4
                            i32.eq
                            br_if $label66
                            local.get $var0
                            i32.load offset=8
                            local.tee $var0
                            br_if $label67
                            br $label68
                          end $label67
                        end $label66
                        local.get $var0
                        i32.load offset=12
                        i32.eqz
                        br_if $label69
                      end $label68
                      i32.const 1048704
                      local.set $var0
                      block $label71
                        loop $label72
                          block $label70
                            local.get $var0
                            i32.load
                            local.tee $var4
                            local.get $var3
                            i32.gt_u
                            br_if $label70
                            local.get $var3
                            local.get $var4
                            local.get $var0
                            i32.load offset=4
                            i32.add
                            local.tee $var4
                            i32.lt_u
                            br_if $label71
                          end $label70
                          local.get $var0
                          i32.load offset=8
                          local.set $var0
                          br $label72
                        end $label72
                      end $label71
                      i32.const 0
                      local.get $var1
                      i32.store offset=1049004
                      i32.const 0
                      local.get $var7
                      i32.const -40
                      i32.add
                      local.tee $var0
                      i32.store offset=1048996
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
                      i32.store offset=1049016
                      local.get $var3
                      local.get $var4
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
                      local.tee $var6
                      i32.const 27
                      i32.store offset=4
                      i32.const 0
                      i64.load offset=1048704 align=4
                      local.set $var9
                      local.get $var6
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1048712 align=4
                      i64.store align=4
                      local.get $var6
                      i32.const 8
                      i32.add
                      local.tee $var0
                      local.get $var9
                      i64.store align=4
                      i32.const 0
                      local.get $var7
                      i32.store offset=1048708
                      i32.const 0
                      local.get $var1
                      i32.store offset=1048704
                      i32.const 0
                      local.get $var0
                      i32.store offset=1048712
                      i32.const 0
                      i32.const 0
                      i32.store offset=1048716
                      local.get $var6
                      i32.const 28
                      i32.add
                      local.set $var0
                      loop $label73
                        local.get $var0
                        i32.const 7
                        i32.store
                        local.get $var0
                        i32.const 4
                        i32.add
                        local.tee $var0
                        local.get $var4
                        i32.lt_u
                        br_if $label73
                      end $label73
                      local.get $var6
                      local.get $var3
                      i32.eq
                      br_if $label64
                      local.get $var6
                      local.get $var6
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get $var3
                      local.get $var6
                      local.get $var3
                      i32.sub
                      local.tee $var0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var6
                      local.get $var0
                      i32.store
                      block $label74
                        local.get $var0
                        i32.const 256
                        i32.lt_u
                        br_if $label74
                        local.get $var3
                        local.get $var0
                        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E
                        br $label64
                      end $label74
                      block $label76
                        block $label75
                          i32.const 0
                          i32.load offset=1048984
                          local.tee $var4
                          i32.const 1
                          local.get $var0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee $var1
                          i32.and
                          br_if $label75
                          i32.const 0
                          local.get $var4
                          local.get $var1
                          i32.or
                          i32.store offset=1048984
                          local.get $var0
                          i32.const 248
                          i32.and
                          i32.const 1048720
                          i32.add
                          local.tee $var0
                          local.set $var4
                          br $label76
                        end $label75
                        local.get $var0
                        i32.const 248
                        i32.and
                        local.tee $var4
                        i32.const 1048720
                        i32.add
                        local.set $var0
                        local.get $var4
                        i32.const 1048728
                        i32.add
                        i32.load
                        local.set $var4
                      end $label76
                      local.get $var0
                      local.get $var3
                      i32.store offset=8
                      local.get $var4
                      local.get $var3
                      i32.store offset=12
                      local.get $var3
                      local.get $var0
                      i32.store offset=12
                      local.get $var3
                      local.get $var4
                      i32.store offset=8
                      br $label64
                    end $label69
                    local.get $var0
                    local.get $var1
                    i32.store
                    local.get $var0
                    local.get $var0
                    i32.load offset=4
                    local.get $var7
                    i32.add
                    i32.store offset=4
                    local.get $var1
                    local.get $var2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $var6
                    i32.const 15
                    i32.add
                    i32.const -8
                    i32.and
                    i32.const -8
                    i32.add
                    local.tee $var4
                    local.get $var1
                    local.get $var2
                    i32.add
                    local.tee $var0
                    i32.sub
                    local.set $var3
                    local.get $var4
                    i32.const 0
                    i32.load offset=1049004
                    i32.eq
                    br_if $label77
                    local.get $var4
                    i32.const 0
                    i32.load offset=1049000
                    i32.eq
                    br_if $label78
                    block $label79
                      local.get $var4
                      i32.load offset=4
                      local.tee $var2
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.ne
                      br_if $label79
                      local.get $var4
                      local.get $var2
                      i32.const -8
                      i32.and
                      local.tee $var2
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E
                      local.get $var2
                      local.get $var3
                      i32.add
                      local.set $var3
                      local.get $var4
                      local.get $var2
                      i32.add
                      local.tee $var4
                      i32.load offset=4
                      local.set $var2
                    end $label79
                    local.get $var4
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
                    block $label80
                      local.get $var3
                      i32.const 256
                      i32.lt_u
                      br_if $label80
                      local.get $var0
                      local.get $var3
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E
                      br $label81
                    end $label80
                    block $label83
                      block $label82
                        i32.const 0
                        i32.load offset=1048984
                        local.tee $var2
                        i32.const 1
                        local.get $var3
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee $var4
                        i32.and
                        br_if $label82
                        i32.const 0
                        local.get $var2
                        local.get $var4
                        i32.or
                        i32.store offset=1048984
                        local.get $var3
                        i32.const 248
                        i32.and
                        i32.const 1048720
                        i32.add
                        local.tee $var3
                        local.set $var2
                        br $label83
                      end $label82
                      local.get $var3
                      i32.const 248
                      i32.and
                      local.tee $var2
                      i32.const 1048720
                      i32.add
                      local.set $var3
                      local.get $var2
                      i32.const 1048728
                      i32.add
                      i32.load
                      local.set $var2
                    end $label83
                    local.get $var3
                    local.get $var0
                    i32.store offset=8
                    local.get $var2
                    local.get $var0
                    i32.store offset=12
                    local.get $var0
                    local.get $var3
                    i32.store offset=12
                    local.get $var0
                    local.get $var2
                    i32.store offset=8
                    br $label81
                  end $label56
                  i32.const 0
                  local.get $var0
                  local.get $var2
                  i32.sub
                  local.tee $var3
                  i32.store offset=1048996
                  i32.const 0
                  i32.const 0
                  i32.load offset=1049004
                  local.tee $var0
                  local.get $var2
                  i32.add
                  local.tee $var4
                  i32.store offset=1049004
                  local.get $var4
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
                  br $label28
                end $label55
                i32.const 0
                i32.load offset=1049000
                local.set $var3
                block $label85
                  block $label84
                    local.get $var0
                    local.get $var2
                    i32.sub
                    local.tee $var4
                    i32.const 15
                    i32.gt_u
                    br_if $label84
                    i32.const 0
                    i32.const 0
                    i32.store offset=1049000
                    i32.const 0
                    i32.const 0
                    i32.store offset=1048992
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
                    br $label85
                  end $label84
                  i32.const 0
                  local.get $var4
                  i32.store offset=1048992
                  i32.const 0
                  local.get $var3
                  local.get $var2
                  i32.add
                  local.tee $var1
                  i32.store offset=1049000
                  local.get $var1
                  local.get $var4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var3
                  local.get $var0
                  i32.add
                  local.get $var4
                  i32.store
                  local.get $var3
                  local.get $var2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                end $label85
                local.get $var3
                i32.const 8
                i32.add
                return
              end $label65
              local.get $var0
              local.get $var6
              local.get $var7
              i32.add
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=1049004
              local.tee $var0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee $var3
              i32.const -8
              i32.add
              local.tee $var4
              i32.store offset=1049004
              i32.const 0
              local.get $var0
              local.get $var3
              i32.sub
              i32.const 0
              i32.load offset=1048996
              local.get $var7
              i32.add
              local.tee $var3
              i32.add
              i32.const 8
              i32.add
              local.tee $var1
              i32.store offset=1048996
              local.get $var4
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
              i32.store offset=1049016
              br $label64
            end $label77
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
            br $label81
          end $label78
          i32.const 0
          local.get $var0
          i32.store offset=1049000
          i32.const 0
          i32.const 0
          i32.load offset=1048992
          local.get $var3
          i32.add
          local.tee $var3
          i32.store offset=1048992
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
        end $label81
        local.get $var1
        i32.const 8
        i32.add
        return
      end $label64
      i32.const 0
      local.set $var0
      i32.const 0
      i32.load offset=1048996
      local.tee $var3
      local.get $var2
      i32.le_u
      br_if $label28
      i32.const 0
      local.get $var3
      local.get $var2
      i32.sub
      local.tee $var3
      i32.store offset=1048996
      i32.const 0
      i32.const 0
      i32.load offset=1049004
      local.tee $var0
      local.get $var2
      i32.add
      local.tee $var4
      i32.store offset=1049004
      local.get $var4
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
    end $label28
    local.get $var0
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E (;2;) (param $var0 i32) (param $var1 i32)
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
      i32.const 38
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
    i32.const 1048576
    i32.add
    local.set $var3
    block $label1
      i32.const 0
      i32.load offset=1048988
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
      i32.load offset=1048988
      local.get $var4
      i32.or
      i32.store offset=1048988
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
          local.tee $var5
          i32.load offset=16
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
    i32.const 16
    i32.add
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
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E (;3;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    local.get $var0
    i32.load offset=12
    local.set $var2
    block $label9
      block $label5
        block $label8
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
            block $label7
              block $label6
                local.get $var0
                local.get $var0
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1048576
                i32.add
                local.tee $var1
                i32.load
                i32.eq
                br_if $label6
                local.get $var3
                i32.load offset=16
                local.get $var0
                i32.eq
                br_if $label7
                local.get $var3
                local.get $var2
                i32.store offset=20
                local.get $var2
                br_if $label8
                br $label5
              end $label6
              local.get $var1
              local.get $var2
              i32.store
              local.get $var2
              i32.eqz
              br_if $label9
              br $label8
            end $label7
            local.get $var3
            local.get $var2
            i32.store offset=16
            local.get $var2
            br_if $label8
            br $label5
          end $label0
          block $label10
            local.get $var2
            local.get $var0
            i32.load offset=8
            local.tee $var4
            i32.eq
            br_if $label10
            local.get $var4
            local.get $var2
            i32.store offset=12
            local.get $var2
            local.get $var4
            i32.store offset=8
            return
          end $label10
          i32.const 0
          i32.const 0
          i32.load offset=1048984
          i32.const -2
          local.get $var1
          i32.const 3
          i32.shr_u
          i32.rotl
          i32.and
          i32.store offset=1048984
          return
        end $label8
        local.get $var2
        local.get $var3
        i32.store offset=24
        block $label11
          local.get $var0
          i32.load offset=16
          local.tee $var1
          i32.eqz
          br_if $label11
          local.get $var2
          local.get $var1
          i32.store offset=16
          local.get $var1
          local.get $var2
          i32.store offset=24
        end $label11
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
      return
    end $label9
    i32.const 0
    i32.const 0
    i32.load offset=1048988
    i32.const -2
    local.get $var0
    i32.load offset=28
    i32.rotl
    i32.and
    i32.store offset=1048988
  )
)