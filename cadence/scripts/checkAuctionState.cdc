import NFTAuction from 0x06

access(all) fun main(nftID: UInt64): {String: AnyStruct}? {
    let auctionRef = NFTAuction.auctions[nftID]

    if auctionRef == nil {
        return nil
    }

    let auction = auctionRef!
    return {
        "nftID": auction.nftID,
        "owner": auction.owner,
        "startingBid": auction.startingBid,
        "highestBid": auction.highestBid,
        "highestBidder": auction.highestBidder ?? "None",
        "isActive": auction.isActive
    }
}
