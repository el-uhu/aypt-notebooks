### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 0557cb93-8a97-4bdf-8315-172da110ba93
# Load dependencies for simualtions
using PlutoUI

# ╔═╡ 93de47da-244a-11ec-2f0a-5d3c11819d2b
md"""
# Three-Sided Dice

## Aufgabe

*To land a coin on its side is often associated with the idea of a rare occurrence. What should be the physical and geometrical characteristics of a cylindrical dice so that it has the same probability to land on its side and one of its faces?*

Münzen landen sehr selten auf der Kante, weil die Kante viel schmäler ist als die beiden Seiten. Wie müsste eine zylindrische “Münze”/”Würfel” aussehen umgenauso wahrscheinlich auf der “Kante” zu landen wie auf den Seiten?

## Mögliche Fragestellungen

- Wie sollte die Form so einer fairen 3-seitigen “Münze” aussehen? Wie dick muss sie relativ zum Durchmesser sein?
- Ist das Material relevant? Ist die perfekte Form für eine harte Münze anders als für eine weiche (z.B. aus Gummi oder Schaumstoff)? Ist der Untergrund auf den man diese “Münze” wirft relevant?
- Ist die Art und Weise wie man die “Münze” wirft relevant?

## Experimente

### Dicke der Münze

Der wahrscheinlich wichtigste Parameter ist die Dicke der Münze. Sehr schmale Münzen werden fast immer auf einer der beiden Seiten landen. Sehr dicke “Münzen”/Zylinder fast immer auf der “Kante”. Bau dir verschieden dicke Münzen und wirf jede davon eine gegebene Anzahl (z.B. je 20 Mal). Wie viel % der Würfe landen jeweils auf der Kante? Wie sieht die Wahrscheinlichkeit auf der Kante zu landen als Funktion der Dicke aus? Eine mögliche Darstellung könnte eine Grafik ähnlich zu dieser hier sein:
"""

# ╔═╡ 3fc52768-7b08-49a4-9e10-e18c3cb3101a
md"""
### Unsicherheitsanalyse
Fortgeschrittene können auch überlegen wie groß die Messunsicherheit dieser Kurven ist. Die genaue %-Zahl der Kantentreffer ist ja von den zufälligen Münzwürfen abhängig. Wie groß ist daher jeweils die Unsicherheit des Mittelwerts? 

### Material
Was passiert wenn du unterschiedliche Materialien verwendest, z.B. Holz, Kunststoff, Schaumstoff. Ist es relevant ob der Zylinder hohl ist oder nicht?


## Theorie
### Schwerpunkt
Ob ein Ding umfällt oder stabil stehen bleibt hängt davon ab, ob der Schwerpunkt innerhalb der Auflagepunkte/Drehpunkte liegt. Die dünne Münze in der Skizze fällt leicht auf eine der beiden Seiten, weil schon bei leichter Verkippung der Schwerpunkt außerhalb des Auflagepunkts liegt und die Münze deshalb nach rechts umfällt. Verkippt man die rechte, dicke “Münze” fällt sie dagegen wieder retour auf die “Kante”. Kannst du geometrisch berechnen für welche Winkel die Münze auf die Kante kippen wird und für welche Winkel sie auf die Seite fällt? Bei wie viel % der möglichen Winkel (von 0-180°) fällt die Münze auf die Kante vs. auf die Seite? Wie hängt dieser Prozentsatz von der Dicke ab? Ergibt die Rechnung ähnliche Ergebnisse wie das Experiment? Wo gibt es Abweichungen und warum?

### Dynamik
Wenn man einen Würfel oder eine Münze wirft, so hat diese ja auch Schwung und wird mehrfach chaotisch vom Tisch abprallen bevor sie zur Ruhe kommt. Fortgeschrittene können z.B. mittels Energie- und Impulserhaltung versuchen zu berechnen wie so eine Münze abprallt. Berechnet man diese Dynamik so lange bis die Münze zur Ruhe kommt, kann man für zufällige Startbedingungen die Endposition berechnen. Was ergibt so eine Rechnung/Computersimulation als faire Münzdicke?
"""

# ╔═╡ ca167561-18a4-4997-981d-db3fb481dadf
md"""
## Simulation
"""

# ╔═╡ 5121f91b-0c1e-468a-9e06-b7a1a8cdf2eb
md"""
| Parameter            | Value                                                       |
|----------------------|-------------------------------------------------------------|
| $h$                  | $(@bind h Slider(0:0.01:2, default = 1, show_value = true)) |
| $R$                  | $(@bind R Slider(0:0.01:4, default = 1, show_value = true))
"""

# ╔═╡ 9fe290ac-a97b-4b4f-a3c3-7f085e817697
md"""
| Parameter                       | Value                                            |
|---------------------------------|--------------------------------------------------|
| $\eta = \frac{h}{R}$            | $(η = h/R)                                       |
| $l= \sqrt{R^{2} + (h/2)^{2}}$   | $(l = sqrt(R^2 + (h/2)^2))                       |
"""

# ╔═╡ c4c42415-3734-4ec2-877c-93c57760594a
2^2

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.14"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[HypertextLiteral]]
git-tree-sha1 = "72053798e1be56026b81d4e2682dbe58922e5ec9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.0"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "a8709b968a1ea6abc2dc1967cb1db6ac9a00dfb6"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.5"

[[PlutoUI]]
deps = ["Base64", "Dates", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "d1fb76655a95bf6ea4348d7197b22e889a4375f4"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.14"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─0557cb93-8a97-4bdf-8315-172da110ba93
# ╟─93de47da-244a-11ec-2f0a-5d3c11819d2b
# ╟─3fc52768-7b08-49a4-9e10-e18c3cb3101a
# ╟─ca167561-18a4-4997-981d-db3fb481dadf
# ╟─5121f91b-0c1e-468a-9e06-b7a1a8cdf2eb
# ╠═9fe290ac-a97b-4b4f-a3c3-7f085e817697
# ╠═c4c42415-3734-4ec2-877c-93c57760594a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
