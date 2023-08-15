defmodule OurFistApiTest.RouterTest do

  use ExUnit.Case, async: true

  use Plug.Test

  @opts OurFirstApi.Router.init([])

  test "Test entry address" do
    build_conn = conn(:get, "/")
    conn = OurFirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  test "Test the alien endpoint" do
    build_conn = conn(:get, "/alien")

    conn = OurFirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Alien Works"
  end


end
