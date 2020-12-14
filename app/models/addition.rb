class Addition
    attr_reader :parcel1, :parcel2, :sum

    def initialize(parcel1, parcel2)
        @parcel1 = parcel1
        @parcel2 = parcel2
        @sum = parcel1 + parcel2
    end
end