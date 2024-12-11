access(all) contract NFTAuction {

    // Створення аукціону
    access(all) event AuctionCreated(nftID: UInt64, startingBid: UFix64, owner: Address)

    // Нова ставка
    access(all) event BidPlaced(nftID: UInt64, bidder: Address, bidAmount: UFix64)

    // Завершення аукціону
    access(all) event AuctionFinalized(nftID: UInt64, winner: Address, finalAmount: UFix64)

    // Структура для збереження інформації про аукціон
    access(all) struct Auction {
        access(all) let nftID: UInt64 // Ідентифікатор NFT
        access(all) let owner: Address // Власник NFT
        access(all) let startingBid: UFix64 // Початкова ставка
        access(all) var highestBid: UFix64 // Найвища ставка
        access(all) var highestBidder: Address? // Адреса учасника з найвищою ставкою
        access(all) var isActive: Bool // Статус аукціону

        init(nftID: UInt64, owner: Address, startingBid: UFix64) {
            self.nftID = nftID
            self.owner = owner
            self.startingBid = startingBid
            self.highestBid = startingBid
            self.highestBidder = nil
            self.isActive = true
            log("Аукціон створено для NFT з ID: ".concat(nftID.toString()))
        }

        // Метод для розміщення ставки
        access(all) fun placeBid(bidder: Address, amount: UFix64) {
            pre {
                amount > self.highestBid: "Сума ставки повинна бути вищою за поточну"
                self.isActive: "Аукціон неактивний"
            }

            self.highestBid = amount
            self.highestBidder = bidder
            log("Ставка розміщена: ".concat(amount.toString()).concat(" від ").concat(bidder.toString()))
        }

        // Метод для завершення аукціону
        access(all) fun finalizeAuction() {
            pre {
                self.isActive: "Аукціон вже завершено"
            }

            self.isActive = false
            log("Аукціон завершено. Переможець: ".concat(self.highestBidder?.toString() ?? "Немає").concat(" Сума: ").concat(self.highestBid.toString()))
        }
    }

    // Карта для збереження аукціонів за ID NFT
    access(all) var auctions: {UInt64: Auction}

    init() {
        self.auctions = {}
    }

    // Метод для створення аукціону
    access(all) fun createAuction(nftID: UInt64, startingBid: UFix64, owner: Address) {
        pre {
            self.auctions[nftID] == nil: "Аукціон вже існує для цього NFT"
        }

        self.auctions[nftID] = Auction(nftID: nftID, owner: owner, startingBid: startingBid)
        emit AuctionCreated(nftID: nftID, startingBid: startingBid, owner: owner)
        log("Аукціон створено для NFT з ID: ".concat(nftID.toString()))
    }

    // Метод для розміщення ставки
    access(all) fun placeBid(nftID: UInt64, bidder: Address, amount: UFix64) {
        pre {
            self.auctions[nftID] != nil: "Аукціон для цього NFT не існує"
        }

        let auction: &Auction = &self.auctions[nftID]!
        auction.placeBid(bidder: bidder, amount: amount)

        emit BidPlaced(nftID: nftID, bidder: bidder, bidAmount: amount)
        log("Нова ставка: ".concat(amount.toString()).concat(" для NFT ID ").concat(nftID.toString()))
    }

    // Метод для завершення аукціону
    access(all) fun finalizeAuction(nftID: UInt64) {
        pre {
            self.auctions[nftID] != nil: "Аукціон для цього NFT не існує"
        }

        let auction: &Auction = &self.auctions[nftID]!
        auction.finalizeAuction()

        emit AuctionFinalized(
            nftID: nftID,
            winner: auction.highestBidder ?? auction.owner,
            finalAmount: auction.highestBid
        )
        log("Аукціон завершено для NFT ID: ".concat(nftID.toString()))
    }
}
