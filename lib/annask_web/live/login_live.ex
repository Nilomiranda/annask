defmodule AnnaskWeb.LoginLive do
  use AnnaskWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{email: "", password: "", form_valid: false})}
  end

  @impl true
  def handle_event("login", %{"email" => email, "password" => password}, socket) do
    is_form_valid = validate_form(email, password)

    case is_form_valid do
      false ->
        {:noreply, put_flash(socket, :error, "Invalid credentials")}
      true ->
        {:noreply, socket}
    end
  end

  defp validate_form(email, password) do
    (!is_nil(email) && email !== "") && (!is_nil(password) && password !== "")
  end
end
