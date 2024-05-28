extends Node

func kebun_binatang(start = 0):
	$KebunBinatang.play(start)

func kembang_api(start = 0):
	$KembangApi.play(start)
	
func ponytail(start = 0):
	$Ponytail.play(start)
	
func cara_ceroboh(start = 0):
	$CaraCeroboh.play(start)
	
func cahaya_panjang(start = 0):
	$CahayaPanjang.play(start)

func stop():
	$KebunBinatang.stop()
	$KembangApi.stop()
	$Ponytail.stop()
