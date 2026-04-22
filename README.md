# Aztec Wallet (Demo)

This project sends a demo transaction on a test network using BDK + Esplora.

- Network: Signet descriptors
- Backend API: `https://mutinynet.com/api`
- Default send amount: `1000 sats`

## Prerequisites

1. Install Rust (stable toolchain).
2. Open PowerShell in this project folder.

## Run

Run with default recipient address (from `src/main.rs`):

```powershell
cargo run
```

Run with a custom recipient address:

```powershell
$env:RECIPIENT_ADDRESS = "<testnet-or-signet-address>"
cargo run
```

The app prints a line like:

```text
Sent 1000 sats to <address>. Txid: <txid>
```

Copy the `<txid>` for verification.

## See Sent Sats In Explorer

Use MutinyNet explorer (this project broadcasts there):

```text
https://mutinynet.com/tx/<txid>
```

On that page, open **Outputs** and confirm:

1. Recipient address matches your target address.
2. Output value is `1000 sats`.
3. Status is `confirmed` (or pending in mempool before confirmation).

## See Sent Sats In Terminal (PowerShell)

Replace `<txid>` and run:

```powershell
$tx = "<txid>"
$data = Invoke-RestMethod "https://mutinynet.com/api/tx/$tx"
$data.vout | Select-Object scriptpubkey_address, value | Format-Table -AutoSize
```

Example expected output includes one row with your recipient and `1000` value.

Check only recipient output:

```powershell
$recipient = "<recipient-address>"
$data.vout |
  Where-Object { $_.scriptpubkey_address -eq $recipient } |
  Select-Object scriptpubkey_address, value | Format-Table -AutoSize
```

If `value` is `1000`, the receiver output is present.

## Troubleshooting

- If mempool.space Signet says "Transaction not found", that is expected when using MutinyNet backend.
- Use `https://mutinynet.com/tx/<txid>` for this project.
- If no output appears yet, wait a bit and retry (propagation/confirmation delay).

## Security Note

This is a demo flow for low-value test transactions only. Do not use this setup for production custody.