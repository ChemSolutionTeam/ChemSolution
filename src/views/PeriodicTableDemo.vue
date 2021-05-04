<template>
  <div class="periodicTable">
    <div class="row">
      <div
          class="column mt-32 w-1/6 text-left bg-white border-csblack border rounded"
      >
        <div class="container pl-6">
          <p>Element logo</p>
        </div>
        <div class="container bg-csblack text-white pl-6 pr-6 p-3 pt-1">
          <p>Element info</p>
        </div>
      </div>
      <div
          class="column mt-32 w-9/12 pr-5 pb-5 ml-2 text-left bg-csblack border-csblack border rounded text-white"
      >
        <table id="periodic">
          <tr id="periods">
            <td class="periodCell"></td>
            <td class="periodCell">1</td>
            <td class="periodCell">2</td>
            <td class="periodCell">3</td>
            <td class="periodCell">4</td>
            <td class="periodCell">5</td>
            <td class="periodCell">6</td>
            <td class="periodCell">7</td>
            <td class="periodCell">8</td>
            <td class="periodCell">9</td>
            <td class="periodCell">10</td>
            <td class="periodCell">11</td>
            <td class="periodCell">12</td>
            <td class="periodCell">13</td>
            <td class="periodCell">14</td>
            <td class="periodCell">15</td>
            <td class="periodCell">16</td>
            <td class="periodCell">17</td>
            <td class="periodCell">18</td>
          </tr>
          <tr id="p1">
            <td class="groupCell">1</td>
            <td id="H" class="reactiveNonMetal" title="Hydrogen"><sup>1</sup>H</td>
            <td class="empty" colspan="16"></td>
            <td id="He" class="nobleGas" title="Helium"><sup>2</sup>He</td>
          </tr>
          <tr id="p2">
            <td class="groupCell">2</td>
            <td id="Li" class="alkaliMetal" title="Lithium"><sup>3</sup>Li</td>
            <td id="Be" class="alkalineEarthMetal" title="Beryllium"><sup>4</sup>Be</td>
            <td class="legend alkaliMetals" colspan="2" rowspan="1">лужні метали</td>
            <td class="legend transitionMetals" colspan="2" rowspan="2">перехідні метали</td>
            <td class="legend lanthanoids" colspan="2" rowspan="1">лантаноїди</td>
            <td class="legend metalloids" colspan="2" rowspan="1">напівметали</td>
            <td class="legend nobleGases" colspan="2" rowspan="1">благородні гази</td>
            <td id="B" class="metalloid" title="Boron"><sup>5</sup>B</td>
            <td id="C" class="reactiveNonMetal" title="Carbon"><sup>6</sup>C</td>
            <td id="N" class="reactiveNonMetal" title="Nitrogen"><sup>7</sup>N</td>
            <td id="O" class="reactiveNonMetal" title="Oxygen"><sup>8</sup>O</td>
            <td id="F" class="reactiveNonMetal" title="Fluorine"><sup>9</sup>F</td>
            <td id="Ne" class="nobleGas" title="Neon"><sup>10</sup>Ne</td>
          </tr>
          <tr id="p3">
            <td class="groupCell">3</td>
            <td id="Na" class="alkaliMetal" title="Sodium"><sup>11</sup>Na</td>
            <td id="Mg" class="alkalineEarthMetal" title="Magnesium"><sup>12</sup>Mg</td>
            <td class="legend alkalineEarthMetals" colspan="2" rowspan="1">лужноземельні метали</td>
            <td class="legend actinoids" colspan="2" rowspan="1">актиноїди</td>
            <td class="legend postTransitionMetals" colspan="2" rowspan="1">постперехідні метали</td>
            <td class="legend reactiveNonMetals" colspan="2" rowspan="1">неметали</td>
            <td id="Al" class="postTransitionMetal" title="Aluminium"><sup>13</sup>Al</td>
            <td id="Si" class="metalloid" title="Silicon"><sup>14</sup>Si</td>
            <td id="P" class="reactiveNonMetal" title="Phosphorus"><sup>15</sup>P</td>
            <td id="S" class="reactiveNonMetal" title="Sulfur"><sup>16</sup>S</td>
            <td id="Cl" class="reactiveNonMetal" title="Chlorine"><sup>17</sup>Cl</td>
            <td id="Ar" class="nobleGas" title="Argon"><sup>18</sup>Ar</td>
          </tr>
          <tr id="p4">
            <td class="groupCell">4</td>
            <td id="K" class="alkaliMetal" title="Potassium"><sup>19</sup>K</td>
            <td id="Ca" class="alkalineEarthMetal" title="Calcium"><sup>20</sup>Ca</td>
            <td id="Sc" class="transitionMetal" title="Scandium"><sup>21</sup>Sc</td>
            <td id="Ti" class="transitionMetal" title="Titanium"><sup>22</sup>Ti</td>
            <td id="V" class="transitionMetal" title="Vanadium"><sup>23</sup>V</td>
            <td id="Cr" class="transitionMetal" title="Chromium"><sup>24</sup>Cr</td>
            <td id="Mn" class="transitionMetal" title="Manganese"><sup>25</sup>Mn</td>
            <td id="Fe" class="transitionMetal" title="Iron"><sup>26</sup>Fe</td>
            <td id="Co" class="transitionMetal" title="Cobalt"><sup>27</sup>Co</td>
            <td id="Ni" class="transitionMetal" title="Nickel"><sup>28</sup>Ni</td>
            <td id="Cu" class="transitionMetal" title="Copper"><sup>29</sup>Cu</td>
            <td id="Zn" class="transitionMetal" title="Zinc"><sup>30</sup>Zn</td>
            <td id="Ga" class="postTransitionMetal" title="Gallium"><sup>31</sup>Ga</td>
            <td id="Ge" class="metalloid" title="Germanium"><sup>32</sup>Ge</td>
            <td id="As" class="metalloid" title="Arsenic"><sup>33</sup>As</td>
            <td id="Se" class="reactiveNonMetal" title="Selenium"><sup>34</sup>Se</td>
            <td id="Br" class="reactiveNonMetal" title="Bromine"><sup>35</sup>Br</td>
            <td id="Kr" class="nobleGas" title="Krypton"><sup>36</sup>Kr</td>
          </tr>
          <tr id="p5">
            <td class="groupCell">5</td>
            <td id="Rb" class="alkaliMetal" title="Rubidium"><sup>37</sup>Rb</td>
            <td id="Sr" class="alkalineEarthMetal" title="Strontium"><sup>38</sup>Sr</td>
            <td id="Y" class="transitionMetal" title="Yttrium"><sup>39</sup>Y</td>
            <td id="Zr" class="transitionMetal" title="Zirconium"><sup>40</sup>Zr</td>
            <td id="Nb" class="transitionMetal" title="Niobium"><sup>41</sup>Nb</td>
            <td id="Mo" class="transitionMetal" title="Molybdenum"><sup>42</sup>Mo</td>
            <td id="Tc" class="transitionMetal" title="Technetium"><sup>43</sup>Tc</td>
            <td id="Ru" class="transitionMetal" title="Ruthenium"><sup>44</sup>Ru</td>
            <td id="Rh" class="transitionMetal" title="Rhodium"><sup>45</sup>Rh</td>
            <td id="Pd" class="transitionMetal" title="Palladium"><sup>46</sup>Pd</td>
            <td id="Ag" class="transitionMetal" title="Silver"><sup>47</sup>Ag</td>
            <td id="Cd" class="transitionMetal" title="Cadmium"><sup>48</sup>Cd</td>
            <td id="In" class="postTransitionMetal" title="Indium"><sup>49</sup>In</td>
            <td id="Sn" class="postTransitionMetal" title="Tin"><sup>50</sup>Sn</td>
            <td id="Sb" class="metalloid" title="Antimony"><sup>51</sup>Sb</td>
            <td id="Te" class="metalloid" title="Tellurium"><sup>52</sup>Te</td>
            <td id="I" class="reactiveNonMetal" title="Iodine"><sup>53</sup>I</td>
            <td id="Xe" class="nobleGas" title="Xenon"><sup>54</sup>Xe</td>
          </tr>
          <tr id="p6">
            <td class="groupCell">6</td>
            <td id="Cs" class="alkaliMetal" title="Caesium"><sup>55</sup>Cs</td>
            <td id="Ba" class="alkalineEarthMetal" title="Barium"><sup>56</sup>Ba</td>
            <td class="empty"></td>
            <td id="Hf" class="transitionMetal" title="Hafnium"><sup>72</sup>Hf</td>
            <td id="Ta" class="transitionMetal" title="Tantalum"><sup>73</sup>Ta</td>
            <td id="W" class="transitionMetal" title="Tungsten"><sup>74</sup>W</td>
            <td id="Re" class="transitionMetal" title="Rhenium"><sup>75</sup>Re</td>
            <td id="Os" class="transitionMetal" title="Osmium"><sup>76</sup>Os</td>
            <td id="Ir" class="transitionMetal" title="Iridium"><sup>77</sup>Ir</td>
            <td id="Pt" class="transitionMetal" title="Platinum"><sup>78</sup>Pt</td>
            <td id="Au" class="transitionMetal" title="Gold"><sup>79</sup>Au</td>
            <td id="Hg" class="transitionMetal" title="Mercury"><sup>80</sup>Hg</td>
            <td id="Tl" class="postTransitionMetal" title="Thallium"><sup>81</sup>Tl</td>
            <td id="Pb" class="postTransitionMetal" title="Lead"><sup>82</sup>Pb</td>
            <td id="Bi" class="postTransitionMetal" title="Bismuth"><sup>83</sup>Bi</td>
            <td id="Po" class="postTransitionMetal" title="Polonium"><sup>84</sup>Po</td>
            <td id="At" class="metalloid" title="Astatine"><sup>85</sup>At</td>
            <td id="Rn" class="nobleGas" title="Radon"><sup>86</sup>Rn</td>
          </tr>
          <tr id="p7">
            <td class="groupCell">7</td>
            <td id="Fr" class="alkaliMetal" title="Francium"><sup>87</sup>Fr</td>
            <td id="Ra" class="alkalineEarthMetal" title="Radium"><sup>88</sup>Ra</td>
            <td class="empty"></td>
            <td id="Rf" class="transitionMetal" title="Rutherfordium"><sup>104</sup>Rf</td>
            <td id="Db" class="transitionMetal" title="Dubnium"><sup>105</sup>Db</td>
            <td id="Sg" class="transitionMetal" title="Seaborgium"><sup>106</sup>Sg</td>
            <td id="Bh" class="transitionMetal" title="Bohrium"><sup>107</sup>Bh</td>
            <td id="Hs" class="transitionMetal" title="Hassium"><sup>108</sup>Hs</td>
            <td id="Mt" title="Meitnerium"><sup>109</sup>Mt</td>
            <td id="Ds" title="Darmstadtium"><sup>110</sup>Ds</td>
            <td id="Rg" title="Roentgenium"><sup>111</sup>Rg</td>
            <td id="Cn" title="Copernicium"><sup>112</sup>Cn</td>
            <td id="Nh" title="Nihonium"><sup>113</sup>Nh</td>
            <td id="Fl" title="Flerovium"><sup>114</sup>Fl</td>
            <td id="Mc" title="Moscovium"><sup>115</sup>Mc</td>
            <td id="Lv" title="Livermorium"><sup>116</sup>Lv</td>
            <td id="Ts" title="Tennessine"><sup>117</sup>Ts</td>
            <td id="Og" title="Oganesson"><sup>118</sup>Og</td>
          </tr>
          <tr class="spacer">
            <td class="empty" colspan=18></td>
          </tr>
          <tr>
            <td class="empty" colspan="2"></td>
            <td class="groupCell">6</td>
            <td id="La" class="lanthanoid" title="Lanthanum"><sup>57</sup>La</td>
            <td id="Ce" class="lanthanoid" title="Cerium"><sup>58</sup>Ce</td>
            <td id="Pr" class="lanthanoid" title="Praseodymium"><sup>59</sup>Pr</td>
            <td id="Nd" class="lanthanoid" title="Neodymium"><sup>60</sup>Nd</td>
            <td id="Pm" class="lanthanoid" title="Promethium"><sup>61</sup>Pm</td>
            <td id="Sm" class="lanthanoid" title="Samarium"><sup>62</sup>Sm</td>
            <td id="Eu" class="lanthanoid" title="Europium"><sup>63</sup>Eu</td>
            <td id="Gd" class="lanthanoid" title="Gadolinium"><sup>64</sup>Gd</td>
            <td id="Tb" class="lanthanoid" title="Terbium"><sup>65</sup>Tb</td>
            <td id="Dy" class="lanthanoid" title="Dysprosium"><sup>66</sup>Dy</td>
            <td id="Ho" class="lanthanoid" title="Holmium"><sup>67</sup>Ho</td>
            <td id="Er" class="lanthanoid" title="Erbium"><sup>68</sup>Er</td>
            <td id="Tm" class="lanthanoid" title="Thulium"><sup>69</sup>Tm</td>
            <td id="Yb" class="lanthanoid" title="Ytterbium"><sup>70</sup>Yb</td>
            <td id="Lu" class="lanthanoid" title="Lutetium"><sup>71</sup>Lu</td>
            <td class="empty"></td>
          </tr>
          <tr>
            <td class="empty" colspan="2"></td>
            <td class="groupCell">7</td>
            <td id="Ac" class="actinoid" title="Actinium"><sup>89</sup>Ac</td>
            <td id="Th" class="actinoid" title="Thorium"><sup>90</sup>Th</td>
            <td id="Pa" class="actinoid" title="Protactinium"><sup>91</sup>Pa</td>
            <td id="U" class="actinoid" title="Uranium"><sup>92</sup>U</td>
            <td id="Np" class="actinoid" title="Neptunium"><sup>93</sup>Np</td>
            <td id="Pu" class="actinoid" title="Plutonium"><sup>94</sup>Pu</td>
            <td id="Am" class="actinoid" title="Americium"><sup>95</sup>Am</td>
            <td id="Cm" class="actinoid" title="Curium"><sup>96</sup>Cm</td>
            <td id="Bk" class="actinoid" title="Berkelium"><sup>97</sup>Bk</td>
            <td id="Cf" class="actinoid" title="Californium"><sup>98</sup>Cf</td>
            <td id="Es" class="actinoid" title="Einsteinium"><sup>99</sup>Es</td>
            <td id="Fm" class="actinoid" title="Fermium"><sup>100</sup>Fm</td>
            <td id="Md" class="actinoid" title="Mendelevium"><sup>101</sup>Md</td>
            <td id="No" class="actinoid" title="Nobelium"><sup>102</sup>No</td>
            <td id="Lr" class="actinoid" title="Lawrencium"><sup>103</sup>Lr</td>
            <td class="empty"></td>
          </tr>
        </table>

      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PeriodicTable',
}
</script>

<style type="text/css">


#periodic {
  margin: 2px;
  border-collapse: separate;
  border-spacing: 3px;
}

@media (min-width: 701px) and (max-width: 800px) {
  #periodic {
    border-spacing: 2px;
  }
}

@media (max-width: 700px) {
  #periodic {
    border-spacing: 1px;
  }
}

#periodic tr td {
  background-color: transparent;
  width: 70px;
  height: 70px;
  cursor: pointer;
  border-width: 3px;
  border-spacing: 6px;
}

@media (max-width: 700px) {
  #periodic tr td {
    border-width: 2px;
  }
}

#periodic tr td.empty {
  background-color: transparent;
  cursor: auto;
  border: transparent;
  text-align: left;
}

#periodic tr.spacer td {
  height: 20px;
}

#periodic tr td sup {
  font-size: 11px;
  display: block;
  text-align: center;
}

#periodic tr td {
  font-size: 22px;
  text-align: center;
  position: relative;
}

#periodic tr td.alkalineEarthMetal {
  border-color: #F59A23;
  background: #ab6b18;
  font-weight: bolder;
}

#periodic tr td.alkaliMetal {
  border-color: #B8741A;
  background: #805112;
  font-weight: bolder;
}

#periodic tr td.transitionMetal {
  border-color: #87131e;
  background: #5e0d15;
  font-weight: bolder;
}

#periodic tr td.lanthanoid {
  border-color: #FFFF80;
  background: #b2b259;
  font-weight: bolder;
}

#periodic tr td.actinoid {
  border-color: #CC66B0;
  background: #8e477b;
  font-weight: bolder;
}

#periodic tr td.metalloid {
  border-color: #21d0b2;
  background: #17917c;
  font-weight: bolder;
}

#periodic tr td.postTransitionMetal {
  border-color: #1DCDFE;
  background: #148fb1;
  font-weight: bolder;
}

#periodic tr td.nobleGas {
  border-color: #8400FF;
  background: #5c00b2;
  font-weight: bolder;
}

#periodic tr td.reactiveNonMetal {
  border-color: #CAF982;
  background: #8dae5b;
  font-weight: bolder;
}

#periodic tr td.legend {
  font-size: 16px;
  text-align: center;
  position: relative;
}

#periodic tr td.legend.alkalineEarthMetals {
  border-color: #F59A23;
  background: #ab6b18;
}

#periodic tr td.legend.alkaliMetals {
  border-color: #B8741A;
  background: #805112;
}

#periodic tr td.legend.transitionMetals {
  border-color: #87131e;
  background: #5e0d15;
}

#periodic tr td.legend.lanthanoids {
  border-color: #FFFF80;
  background: #b2b259;
}

#periodic tr td.legend.actinoids {
  border-color: #CC66B0;
  background: #8e477b;
}

#periodic tr td.legend.metalloids {
  border-color: #21d0b2;
  background: #17917c;
}

#periodic tr td.legend.postTransitionMetals {
  border-color: #1DCDFE;
  background: #148fb1;
}

#periodic tr td.legend.nobleGases {
  border-color: #8400FF;
  background: #5c00b2;
}

#periodic tr td.legend.reactiveNonMetals {
  border-color: #CAF982;
  background: #8dae5b;
}

#periodic tr td.periodCell {
  width: 70px;
  height: 70px;
  cursor: auto;
  border: transparent;
  background: transparent;
}

#periodic tr td.groupCell {
  width: 70px;
  height: 70px;
  cursor: auto;
  border: transparent;
  background: transparent;
}

</style>
