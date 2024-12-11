# **NFT Auction on Flow Blockchain**

## **Overview**
This project implements a decentralized auction system for NFTs on the Flow blockchain. Users can create auctions for NFTs, place bids, and finalize auctions to determine the winner. The contract is written in Cadence, Flow's smart contract programming language.

---

## **Features**
- **Create Auction**: Allows NFT owners to start an auction with a specified starting bid.
- **Place Bids**: Users can place bids on active auctions.
- **Finalize Auction**: Closes the auction and transfers ownership to the highest bidder.
- **Check Auction State**: View the current details of an auction.

---

## **Project Structure**
```
NFT-Auction-Project/
│
├── README.md                       # Project documentation (this file)
│
└── codence/
    ├── contracts/
    │   └── NFTAuction.cdc          # Main auction contract
    │
    ├── transactions/
    │   ├── createAuction.cdc       # Transaction to create an auction
    │   ├── placeBid.cdc            # Transaction to place a bid
    │   └── finalizeAuction.cdc     # Transaction to finalize an auction
    │
    ├── scripts/
    │   ├── checkAuctionState.cdc   # Script to query details of an auction
    │   ├── listActiveAuctions.cdc  # Script to list all active auctions
    │   └── checkHighestBid.cdc     # Script to check the highest bid for an auction
```

### Key Points:
1. All Cadence files (`contracts`, `transactions`, `scripts`) are inside the `codence` folder.
2. The `README.md` file is in the root directory for easier visibility and access.

Let me know if further adjustments are needed!

## **How to Use**
This project is designed to be run entirely within the **Flow Playground**:
1. **Deploy the Contract**:
   - Upload the `NFTAuction.cdc` contract to the Contracts section and deploy it.
2. **Run Transactions**:
   - Use the provided transaction files (`createAuction.cdc`, `placeBid.cdc`, `finalizeAuction.cdc`) to interact with the contract.
   - Customize parameters in the Flow Playground's transaction editor as needed.
3. **Run Scripts**:
   - Use the provided scripts to query contract state or retrieve auction details.
   - Input parameters directly into the Flow Playground's script editor.

---

## **Testing in Flow Playground**
- **Accounts**:
  - Use multiple accounts provided by the Flow Playground to simulate auction owners and bidders.
- **Sample Workflow**:
  1. Deploy the `NFTAuction.cdc` contract.
  2. Create an auction using `createAuction.cdc`.
  3. Place bids on the auction using different accounts via `placeBid.cdc`.
  4. Finalize the auction with `finalizeAuction.cdc` and verify the result.
- **Logs**:
  - Monitor Cadence logs in the Flow Playground to confirm actions like auction creation, bid placement, and finalization.

---

## **Author**
This project is implemented as a learning exercise for Flow's Cadence smart contracts. Thank you for your time!
