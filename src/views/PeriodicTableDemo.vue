<template>
  <div class="periodicTable">
    <div class="row">
      <div
          class="column mt-32 w-1/6 text-left bg-white  border rounded"
      >
        <div class="container pl-6">
          <p>Element logo</p>
        </div>
        <div class="container bg-csblack text-white pl-6 pr-6 p-3 pt-1">
          <p>Element info</p>
        </div>
      </div>
      <div
          class="column mt-32 w-9/12 pr-5 pb-5 ml-2 text-left bg-csblack  border rounded text-white"
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
            <td id="Li" class="alkaliMetal cell" title="Lithium"><sup>3</sup>Li</td>
            <td id="Be" class="alkalineEarthMetal cell" title="Beryllium"><sup>4</sup>Be</td>
            <td class="legend alkaliMetals" colspan="2" rowspan="1">лужні метали</td>
            <td class="legend transitionMetals" colspan="2" rowspan="2">перехідні метали</td>
            <td class="legend lanthanoids" colspan="2" rowspan="1">лантаноїди</td>
            <td class="legend metalloids" colspan="2" rowspan="1">напівметали</td>
            <td class="legend nobleGases" colspan="2" rowspan="1">благородні гази</td>
            <td id="B" class="metalloid cell" title="Boron"><sup>5</sup>B</td>
            <td id="C" class="reactiveNonMetal cell" title="Carbon"><sup>6</sup>C</td>
            <td id="N" class="reactiveNonMetal cell" title="Nitrogen"><sup>7</sup>N</td>
            <td id="O" class="reactiveNonMetal cell" title="Oxygen"><sup>8</sup>O</td>
            <td id="F" class="reactiveNonMetal cell" title="Fluorine"><sup>9</sup>F</td>
            <td id="Ne" class="nobleGas cell" title="Neon"><sup>10</sup>Ne</td>
          </tr>
          <tr id="p3">
            <td class="groupCell">3</td>
            <td @click="get" id="Na" class="alkaliMetal cell" title="Sodium"><sup>11</sup>Na</td>
            <td id="Mg" class="alkalineEarthMetal cell" title="Magnesium"><sup>12</sup>Mg</td>
            <td class="legend alkalineEarthMetals" colspan="2" rowspan="1">лужноземельні метали</td>
            <td class="legend actinoids" colspan="2" rowspan="1">актиноїди</td>
            <td class="legend postTransitionMetals" colspan="2" rowspan="1">постперехідні метали</td>
            <td class="legend reactiveNonMetals" colspan="2" rowspan="1">неметали</td>
            <td id="Al" class="postTransitionMetal cell" title="Aluminium"><sup>13</sup>Al</td>
            <td id="Si" class="metalloid cell" title="Silicon"><sup>14</sup>Si</td>
            <td id="P" class="reactiveNonMetal cell" title="Phosphorus"><sup>15</sup>P</td>
            <td id="S" class="reactiveNonMetal cell" title="Sulfur"><sup>16</sup>S</td>
            <td id="Cl" class="reactiveNonMetal cell" title="Chlorine"><sup>17</sup>Cl</td>
            <td id="Ar" class="nobleGas cell" title="Argon"><sup>18</sup>Ar</td>
          </tr>
          <tr id="p4">
            <td class="groupCell">4</td>
            <td id="K" class="alkaliMetal cell" title="Potassium"><sup>19</sup>K</td>
            <td id="Ca" class="alkalineEarthMetal cell" title="Calcium"><sup>20</sup>Ca</td>
            <td id="Sc" class="transitionMetal cell" title="Scandium"><sup>21</sup>Sc</td>
            <td id="Ti" class="transitionMetal cell" title="Titanium"><sup>22</sup>Ti</td>
            <td id="V" class="transitionMetal cell" title="Vanadium"><sup>23</sup>V</td>
            <td id="Cr" class="transitionMetal cell" title="Chromium"><sup>24</sup>Cr</td>
            <td id="Mn" class="transitionMetal cell" title="Manganese"><sup>25</sup>Mn</td>
            <td id="Fe" class="transitionMetal cell" title="Iron"><sup>26</sup>Fe</td>
            <td id="Co" class="transitionMetal cell" title="Cobalt"><sup>27</sup>Co</td>
            <td id="Ni" class="transitionMetal cell" title="Nickel"><sup>28</sup>Ni</td>
            <td id="Cu" class="transitionMetal cell" title="Copper"><sup>29</sup>Cu</td>
            <td id="Zn" class="transitionMetal cell" title="Zinc"><sup>30</sup>Zn</td>
            <td id="Ga" class="postTransitionMetal cell" title="Gallium"><sup>31</sup>Ga</td>
            <td id="Ge" class="metalloid cell" title="Germanium"><sup>32</sup>Ge</td>
            <td id="As" class="metalloid cell" title="Arsenic"><sup>33</sup>As</td>
            <td id="Se" class="reactiveNonMetal cell" title="Selenium"><sup>34</sup>Se</td>
            <td id="Br" class="reactiveNonMetal cell" title="Bromine"><sup>35</sup>Br</td>
            <td id="Kr" class="nobleGas cell" title="Krypton"><sup>36</sup>Kr</td>
          </tr>
          <tr id="p5">
            <td class="groupCell">5</td>
            <td id="Rb" class="alkaliMetal cell" title="Rubidium"><sup>37</sup>Rb</td>
            <td id="Sr" class="alkalineEarthMetal cell" title="Strontium"><sup>38</sup>Sr</td>
            <td id="Y" class="transitionMetal cell" title="Yttrium"><sup>39</sup>Y</td>
            <td id="Zr" class="transitionMetal cell" title="Zirconium"><sup>40</sup>Zr</td>
            <td id="Nb" class="transitionMetal cell" title="Niobium"><sup>41</sup>Nb</td>
            <td id="Mo" class="transitionMetal cell" title="Molybdenum"><sup>42</sup>Mo</td>
            <td id="Tc" class="transitionMetal cell" title="Technetium"><sup>43</sup>Tc</td>
            <td id="Ru" class="transitionMetal cell" title="Ruthenium"><sup>44</sup>Ru</td>
            <td id="Rh" class="transitionMetal cell" title="Rhodium"><sup>45</sup>Rh</td>
            <td id="Pd" class="transitionMetal cell" title="Palladium"><sup>46</sup>Pd</td>
            <td id="Ag" class="transitionMetal cell" title="Silver"><sup>47</sup>Ag</td>
            <td id="Cd" class="transitionMetal cell" title="Cadmium"><sup>48</sup>Cd</td>
            <td id="In" class="postTransitionMetal cell" title="Indium"><sup>49</sup>In</td>
            <td id="Sn" class="postTransitionMetal cell" title="Tin"><sup>50</sup>Sn</td>
            <td id="Sb" class="metalloid cell" title="Antimony"><sup>51</sup>Sb</td>
            <td id="Te" class="metalloid cell" title="Tellurium"><sup>52</sup>Te</td>
            <td id="I" class="reactiveNonMetal cell" title="Iodine"><sup>53</sup>I</td>
            <td id="Xe" class="nobleGas cell" title="Xenon"><sup>54</sup>Xe</td>
          </tr>
          <tr id="p6">
            <td class="groupCell">6</td>
            <td id="Cs" class="alkaliMetal cell" title="Caesium"><sup>55</sup>Cs</td>
            <td id="Ba" class="alkalineEarthMetal cell" title="Barium"><sup>56</sup>Ba</td>
            <td class="empty"></td>
            <td id="Hf" class="transitionMetal cell" title="Hafnium"><sup>72</sup>Hf</td>
            <td id="Ta" class="transitionMetal cell" title="Tantalum"><sup>73</sup>Ta</td>
            <td id="W" class="transitionMetal cell" title="Tungsten"><sup>74</sup>W</td>
            <td id="Re" class="transitionMetal cell" title="Rhenium"><sup>75</sup>Re</td>
            <td id="Os" class="transitionMetal cell" title="Osmium"><sup>76</sup>Os</td>
            <td id="Ir" class="transitionMetal cell" title="Iridium"><sup>77</sup>Ir</td>
            <td id="Pt" class="transitionMetal cell" title="Platinum"><sup>78</sup>Pt</td>
            <td id="Au" class="transitionMetal cell" title="Gold"><sup>79</sup>Au</td>
            <td id="Hg" class="transitionMetal cell" title="Mercury"><sup>80</sup>Hg</td>
            <td id="Tl" class="postTransitionMetal cell" title="Thallium"><sup>81</sup>Tl</td>
            <td id="Pb" class="postTransitionMetal cell" title="Lead"><sup>82</sup>Pb</td>
            <td id="Bi" class="postTransitionMetal cell" title="Bismuth"><sup>83</sup>Bi</td>
            <td id="Po" class="postTransitionMetal cell" title="Polonium"><sup>84</sup>Po</td>
            <td id="At" class="metalloid cell" title="Astatine"><sup>85</sup>At</td>
            <td id="Rn" class="nobleGas cell" title="Radon"><sup>86</sup>Rn</td>
          </tr>
          <tr id="p7">
            <td class="groupCell">7</td>
            <td id="Fr" class="alkaliMetal cell" title="Francium"><sup>87</sup>Fr</td>
            <td id="Ra" class="alkalineEarthMetal cell" title="Radium"><sup>88</sup>Ra</td>
            <td class="empty"></td>
            <td id="Rf" class="transitionMetal cell" title="Rutherfordium"><sup>104</sup>Rf</td>
            <td id="Db" class="transitionMetal cell" title="Dubnium"><sup>105</sup>Db</td>
            <td id="Sg" class="transitionMetal cell" title="Seaborgium"><sup>106</sup>Sg</td>
            <td id="Bh" class="transitionMetal cell" title="Bohrium"><sup>107</sup>Bh</td>
            <td id="Hs" class="transitionMetal cell" title="Hassium"><sup>108</sup>Hs</td>
            <td id="Mt" class="unknown cell" title="Meitnerium"><sup>109</sup>Mt</td>
            <td id="Ds" class="unknown cell" title="Darmstadtium"><sup>110</sup>Ds</td>
            <td id="Rg" class="unknown cell" title="Roentgenium"><sup>111</sup>Rg</td>
            <td id="Cn" class="unknown cell" title="Copernicium"><sup>112</sup>Cn</td>
            <td id="Nh" class="unknown cell" title="Nihonium"><sup>113</sup>Nh</td>
            <td id="Fl" class="unknown cell" title="Flerovium"><sup>114</sup>Fl</td>
            <td id="Mc" class="unknown cell" title="Moscovium"><sup>115</sup>Mc</td>
            <td id="Lv" class="unknown cell" title="Livermorium"><sup>116</sup>Lv</td>
            <td id="Ts" class="unknown cell" title="Tennessine"><sup>117</sup>Ts</td>
            <td id="Og" class="unknown cell" title="Oganesson"><sup>118</sup>Og</td>
          </tr>
          <tr class="spacer">
            <td class="empty" colspan=18></td>
          </tr>
          <tr>
            <td class="empty" colspan="2"></td>
            <td class="groupCell">6</td>
            <td id="La" class="lanthanoid cell" title="Lanthanum"><sup>57</sup>La</td>
            <td id="Ce" class="lanthanoid cell" title="Cerium"><sup>58</sup>Ce</td>
            <td id="Pr" class="lanthanoid cell" title="Praseodymium"><sup>59</sup>Pr</td>
            <td id="Nd" class="lanthanoid cell" title="Neodymium"><sup>60</sup>Nd</td>
            <td id="Pm" class="lanthanoid cell" title="Promethium"><sup>61</sup>Pm</td>
            <td id="Sm" class="lanthanoid cell" title="Samarium"><sup>62</sup>Sm</td>
            <td id="Eu" class="lanthanoid cell" title="Europium"><sup>63</sup>Eu</td>
            <td id="Gd" class="lanthanoid cell" title="Gadolinium"><sup>64</sup>Gd</td>
            <td id="Tb" class="lanthanoid cell" title="Terbium"><sup>65</sup>Tb</td>
            <td id="Dy" class="lanthanoid cell" title="Dysprosium"><sup>66</sup>Dy</td>
            <td id="Ho" class="lanthanoid cell" title="Holmium"><sup>67</sup>Ho</td>
            <td id="Er" class="lanthanoid cell" title="Erbium"><sup>68</sup>Er</td>
            <td id="Tm" class="lanthanoid cell" title="Thulium"><sup>69</sup>Tm</td>
            <td id="Yb" class="lanthanoid cell" title="Ytterbium"><sup>70</sup>Yb</td>
            <td id="Lu" class="lanthanoid cell" title="Lutetium"><sup>71</sup>Lu</td>
            <td class="empty"></td>
          </tr>
          <tr>
            <td class="empty" colspan="2"></td>
            <td class="groupCell">7</td>
            <td id="Ac" class="actinoid cell" title="Actinium"><sup>89</sup>Ac</td>
            <td id="Th" class="actinoid cell" title="Thorium"><sup>90</sup>Th</td>
            <td id="Pa" class="actinoid cell" title="Protactinium"><sup>91</sup>Pa</td>
            <td id="U" class="actinoid cell" title="Uranium"><sup>92</sup>U</td>
            <td id="Np" class="actinoid cell" title="Neptunium"><sup>93</sup>Np</td>
            <td id="Pu" class="actinoid cell" title="Plutonium"><sup>94</sup>Pu</td>
            <td id="Am" class="actinoid cell" title="Americium"><sup>95</sup>Am</td>
            <td id="Cm" class="actinoid cell" title="Curium"><sup>96</sup>Cm</td>
            <td id="Bk" class="actinoid cell" title="Berkelium"><sup>97</sup>Bk</td>
            <td id="Cf" class="actinoid cell" title="Californium"><sup>98</sup>Cf</td>
            <td id="Es" class="actinoid cell" title="Einsteinium"><sup>99</sup>Es</td>
            <td id="Fm" class="actinoid cell" title="Fermium"><sup>100</sup>Fm</td>
            <td id="Md" class="actinoid cell" title="Mendelevium"><sup>101</sup>Md</td>
            <td id="No" class="actinoid cell" title="Nobelium"><sup>102</sup>No</td>
            <td id="Lr" class="actinoid cell" title="Lawrencium"><sup>103</sup>Lr</td>
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
  background: #F59A23;
  font-weight: bolder;
}

#periodic tr td.alkaliMetal {
  border-color: #B8741A;
  background: #B8741A;
  font-weight: bolder;
}

#periodic tr td.transitionMetal {
  border-color: #87131e;
  background: #87131e;
  font-weight: bolder;
}

#periodic tr td.lanthanoid {
  border-color: #cccc00;
  background: #cccc00;
  font-weight: bolder;
}

#periodic tr td.actinoid {
  border-color: #CC66B0;
  background: #CC66B0;
  font-weight: bolder;
}

#periodic tr td.metalloid {
  border-color: #21d0b2;
  background: #21d0b2;
  font-weight: bolder;
}

#periodic tr td.postTransitionMetal {
  border-color: #1DCDFE;
  background: #1DCDFE;
  font-weight: bolder;
}

#periodic tr td.nobleGas {
  border-color: #8400FF;
  background: #8400FF;
  font-weight: bolder;
}

#periodic tr td.reactiveNonMetal {
  border-color: #a1c768;
  background: #a1c768;
  font-weight: bolder;
}

#periodic tr td.unknown {
  border-color: dimgrey;
  background: dimgrey;
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
  border-color: #cccc00;
  background: #888800;
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
  border-color: #a1c768;
  background: #657c41;
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

.cell {
  transition: all .2s ease-in-out;
}

.cell:hover {
  transform: scale(1.05, 1.05);
}
</style>
