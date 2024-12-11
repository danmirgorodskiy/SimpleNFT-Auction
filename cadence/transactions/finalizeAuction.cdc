import NFTAuction from 0x06

transaction(nftID: UInt64) {
    prepare(signer: &Account) {
        NFTAuction.finalizeAuction(nftID: nftID)
    }
}
