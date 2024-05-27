class DataBobot {
	String? idBobot = "";
	String? jenisWisata = "";
	String? wilayah = "";
	String? rating = "";
	String? hargaTiket = "";
	String? hariOperasional = "";
	String? jamOperasional = "";


  // untuk ignore
  // @JsonKey(ignore: true)
  // bool isSelected = false;

  DataBobot({
	this.idBobot,
	this.jenisWisata,
	this.wilayah,
	this.rating,
	this.hargaTiket,
	this.hariOperasional,
	this.jamOperasional,

  });
}
