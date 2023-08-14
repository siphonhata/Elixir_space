## Concurrency in Elixir by Sipho Ndlalane

**What is concurrency?**

Concurrency is the execution of a set of multiple instruction sequences at the same time. This occurs when there are several process threads running in parallel. These threads communicate with the other threads/processes through a concept of shared memory or through message passing

## Processes

**What is a process?**

Is a task given to do.
Processes in Elixir are isolated from each other, which means a failure in one process doesn't affect the other.

To create a new process in Elixir we use Spawn and Spawn_link and this will return PID's.
Spawn has spawn/1 = spawn(fun)

Spawns the given function, links it to the current process, and returns its PID.

```sh
pid = spawn(fn -> IO.puts("Hello Elixir") end)
```
spawn/3 = spawn(module, atom(), args)

Spawns the given function fun from the given module passing it the given args, links it to the current process, and returns its PID.

```sh
pid = spawn(SomeModule, :function, [1, 2, 3])
```

**Spawn is a way to run something asynchronously.**




