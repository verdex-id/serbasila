extends Node

func kebun_binatang(start = 0):
	stop()
	$KebunBinatang.play(start)

func kembang_api(start = 0):
	stop()
	$KembangApi.play(start)
	
func ponytail(start = 0):
	stop()
	$Ponytail.play(start)
	
func cara_ceroboh(start = 0):
	stop()
	$CaraCeroboh.play(start)
	
func cahaya_panjang(start = 0):
	stop()
	$CahayaPanjang.play(start)

func stop():
	$KebunBinatang.stop()
	$KembangApi.stop()
	$Ponytail.stop()
	$CaraCeroboh.stop()
	$CahayaPanjang.stop()
