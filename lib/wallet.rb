module WalletHelper
  def wallet
    {
      object: "Wallet",
      id: "2",
      transactions: list_for([
        transaction,
        time_transaction
       ],
      'api/wallet/2/transactions'),
      balance: "$20.00",
      balance_cents: 2000,
      created: "2015-05-22T14:56:29.000Z",
      updated: "2015-05-22T14:56:28.000Z"
    }
  end

  def transaction
    {
      object: "Transaction",
      id: "1",
      type: "Guild Credit",
      amount: "$5.00",
      amount_cents: 500,
      created: "2015-05-22T14:56:29.000Z",
      updated: "2015-05-22T14:56:28.000Z"
    }
  end

  def time_transaction
    {
      object: "Time Transaction",
      id: "1",
      type: "Guild Time Credit",
      amount: "$5.00",
      amount_cents: 500,
      rate: "$12.00",
      rate_cents: "1200",
      minimum_seconds: 60,
      created: "2015-05-22T14:56:29.000Z",
      updated: "2015-05-22T14:56:28.000Z"
    }
  end
end
