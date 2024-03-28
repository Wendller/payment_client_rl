defmodule PaymentClientRl.MockAPI do
  def create_payment(user_id, new_payment_info) do
    Process.sleep(random_latency())

    %{
      status: 201,
      user_id: user_id,
      payment: new_payment_info
    }
  end

  # Do something with the resp here
  def handle_create_payment(_resp), do: :ok

  def delete_payment(user_id, payment_id) do
    Process.sleep(random_latency())

    %{
      status: 204,
      user_id: user_id,
      id: payment_id
    }
  end

  # Do something with the resp here
  def handle_delete_payment(_resp), do: :ok

  def charge_payment(user_id, payment_id, amount) do
    Process.sleep(random_latency())

    %{
      status: 200,
      user_id: user_id,
      amount: amount,
      id: payment_id,
      payment_processed: Enum.random(~w(success failed))
    }
  end

  # Do something with the resp here
  def handle_charge_payment(_resp), do: :ok

  defp random_latency, do: Enum.random(100..400)
end
