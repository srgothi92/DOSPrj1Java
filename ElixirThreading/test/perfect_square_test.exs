defmodule DOSPRJ.TaskManagerTest do
    use ExUnit.Case, async: true

    setup do
        {:ok, pid} = DOSPRJ.TaskManager.start_link([])
        {:ok, pid: pid}
    end

    test "Test For N=3 and k=2 " do
        assert DOSPRJ.TaskManager.execute(DOSPRJ.TaskManager,[3,2]) == [[3,4]]
    end

    test "Test For N=40 and k=24 " do
        assert DOSPRJ.TaskManager.execute(DOSPRJ.TaskManager,[40, 24]) == [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], [9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32], [20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43], [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]]
    end

    @tag :distributed
    test "Test Route List" do
        assert DOSPRJ.TaskManager.routingTable() == {:"one@192.168.0.5", :"two@192.168.0.9"}
    end

  end
