import NFTAuction from 0x06

transaction(nftID: UInt64, bidAmount: UFix64) {
    prepare(signer: &Account) {
        NFTAuction.placeBid(nftID: nftID, bidder: signer.address, amount: bidAmount)
    }
}
