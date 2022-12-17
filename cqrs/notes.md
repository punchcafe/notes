# CQRS notes
Notes taken from this site:
https://cqrs.nu/

## Commands
Represented as **present tense** verbs.
An executed command produces immutable events which are now in the event stream:
```elixir
defmodule CommandExecutor do
  @spec execute(command :: Command.t()) :: [Event.t()]
  def execute(command)
end
```

## Events
Should be named as **past tense verbs**. An immutable record that something has occured.

## Aggregates
**Isolated** object or object graph. In this sense, it's similar to the [DDD definition](https://martinfowler.com/bliki/DDD_Aggregate.html) of Aggregate, and can be used similarly when breaking up domain chunks of a system. An aggregates state is made by _aggregating_ over all the events for the given entity:
```elixir
defmodule Aggregate do

  def new_aggregate()

  def build_state(events) do
    Enum.reduce(events, new_aggregate, &apply/2)
  end

  def apply(state, event) 
  ...
end
```
