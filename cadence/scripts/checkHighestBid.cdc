import NFTAuction from 0x06

access(all) fun main(nftID: UInt64): {String: AnyStruct} {
    let auctionRef = NFTAuction.auctions[nftID]

    if auctionRef == nil {
        return {}
    }

    let auction = auctionRef!
    return {
        "highestBid": auction.highestBid,
        "highestBidder": auction.highestBidder ?? "None"
    }
}
