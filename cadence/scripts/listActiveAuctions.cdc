import NFTAuction from 0x06

access(all) fun main(): [UInt64] {
    let activeAuctions: [UInt64] = []

    for auctionID in NFTAuction.auctions.keys {
        let auctionRef = NFTAuction.auctions[auctionID]!
        if auctionRef.isActive {
            activeAuctions.append(auctionID)
        }
    }

    return activeAuctions
}
