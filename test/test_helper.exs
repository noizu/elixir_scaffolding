#-------------------------------------------------------------------------------
# Author: Keith Brings
# Copyright (C) 2018 Noizu Labs, Inc. All rights reserved.
#-------------------------------------------------------------------------------

# http://elixir-lang.org/docs/stable/ex_unit/ExUnit.html#start/1



# Danger Will Robinson.
use  Noizu.Database.Scaffolding.Test.Fixture.FooTable
use  Noizu.Database.Scaffolding.Test.Fixture.FooV2Table
alias Noizu.Database.Scaffolding.Test.Fixture.FooTable
alias Noizu.Database.Scaffolding.Test.Fixture.FooV2Table


Amnesia.stop
Amnesia.Schema.destroy
Amnesia.Schema.create()
Amnesia.start
if !Amnesia.Table.exists?(FooTable), do: FooTable.create(memory: [node()])
if !Amnesia.Table.exists?(FooV2Table), do: FooV2Table.create(memory: [node()])


ExUnit.start(capture_log: true)
