<template>
  <div class="row periodicTable mt-20 h-screen">
    <ElementInfoTable
      v-bind:element="this.element"
      v-bind:bg-color="this.bgColor"
      v-bind:border-color="this.borderColor"
    />
    <div class="column my-20 pb-4 ml-1 bg-csblack rounded text-white">
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
          <td
            @click="getData(1)"
            id="H"
            class="reactiveNonMetal cell"
            title="Hydrogen"
          >
            <sup>1</sup>H
          </td>
          <td class="empty" colspan="16"></td>
          <td
            @click="getData(2, '#8400ff', '#5c00b2')"
            id="He"
            class="nobleGas cell"
            title="Helium"
          >
            <sup>2</sup>He
          </td>
        </tr>
        <tr id="p2">
          <td class="groupCell">2</td>
          <td
            @click="getData(3, '#b8741a', '#805112')"
            id="Li"
            class="alkaliMetal cell"
            title="Lithium"
          >
            <sup>3</sup>Li
          </td>
          <td
            @click="getData(4, '#f59a23', '#ab6b18')"
            id="Be"
            class="alkalineEarthMetal cell"
            title="Beryllium"
          >
            <sup>4</sup>Be
          </td>
          <td class="legend alkaliMetals" colspan="2" rowspan="1">
            лужні метали
          </td>
          <td class="legend transitionMetals" colspan="2" rowspan="2">
            перехідні метали
          </td>
          <td class="legend lanthanoids" colspan="2" rowspan="1">лантаноїди</td>
          <td class="legend metalloids" colspan="2" rowspan="1">напівметали</td>
          <td class="legend nobleGases" colspan="2" rowspan="1">
            благородні гази
          </td>
          <td
            @click="getData(5, '#21d0b2', '#17917c')"
            id="B"
            class="metalloid cell"
            title="Boron"
          >
            <sup>5</sup>B
          </td>
          <td
            @click="getData(6, '#a0c768', '#657c41')"
            id="C"
            class="reactiveNonMetal cell"
            title="Carbon"
          >
            <sup>6</sup>C
          </td>
          <td
            @click="getData(7, '#a0c768', '#657c41')"
            id="N"
            class="reactiveNonMetal cell"
            title="Nitrogen"
          >
            <sup>7</sup>N
          </td>
          <td
            @click="getData(8, '#a0c768', '#657c41')"
            id="O"
            class="reactiveNonMetal cell"
            title="Oxygen"
          >
            <sup>8</sup>O
          </td>
          <td
            @click="getData(9, '#a0c768', '#657c41')"
            id="F"
            class="reactiveNonMetal cell"
            title="Fluorine"
          >
            <sup>9</sup>F
          </td>
          <td
            @click="getData(10, '#8400ff', '#5c00b2')"
            id="Ne"
            class="nobleGas cell"
            title="Neon"
          >
            <sup>10</sup>Ne
          </td>
        </tr>
        <tr id="p3">
          <td class="groupCell">3</td>
          <td
            @click="getData(11, '#b8741a', '#805112')"
            id="Na"
            class="alkaliMetal cell"
            title="Sodium"
          >
            <sup>11</sup>Na
          </td>
          <td
            @click="getData(12, '#f59a23', '#ab6b18')"
            id="Mg"
            class="alkalineEarthMetal cell"
            title="Magnesium"
          >
            <sup>12</sup>Mg
          </td>
          <td class="legend alkalineEarthMetals" colspan="2" rowspan="1">
            лужноземельні метали
          </td>
          <td class="legend actinoids" colspan="2" rowspan="1">актиноїди</td>
          <td class="legend postTransitionMetals" colspan="2" rowspan="1">
            постперехідні метали
          </td>
          <td class="legend reactiveNonMetals" colspan="2" rowspan="1">
            неметали
          </td>
          <td
            @click="getData(13, '#1dcdfe', '#148fb1')"
            id="Al"
            class="postTransitionMetal cell"
            title="Aluminium"
          >
            <sup>13</sup>Al
          </td>
          <td
            @click="getData(14, '#21d0b2', '#17917c')"
            id="Si"
            class="metalloid cell"
            title="Silicon"
          >
            <sup>14</sup>Si
          </td>
          <td
            @click="getData(15, '#a0c768', '#657c41')"
            id="P"
            class="reactiveNonMetal cell"
            title="Phosphorus"
          >
            <sup>15</sup>P
          </td>
          <td
            @click="getData(16, '#a0c768', '#657c41')"
            id="S"
            class="reactiveNonMetal cell"
            title="Sulfur"
          >
            <sup>16</sup>S
          </td>
          <td
            @click="getData(17, '#a0c768', '#657c41')"
            id="Cl"
            class="reactiveNonMetal cell"
            title="Chlorine"
          >
            <sup>17</sup>Cl
          </td>
          <td
            @click="getData(18, '#8400ff', '#5c00b2')"
            id="Ar"
            class="nobleGas cell"
            title="Argon"
          >
            <sup>18</sup>Ar
          </td>
        </tr>
        <tr id="p4">
          <td class="groupCell">4</td>
          <td
            @click="getData(19, '#b8741a', '#805112')"
            id="K"
            class="alkaliMetal cell"
            title="Potassium"
          >
            <sup>19</sup>K
          </td>
          <td
            @click="getData(20, '#f59a23', '#ab6b18')"
            id="Ca"
            class="alkalineEarthMetal cell"
            title="Calcium"
          >
            <sup>20</sup>Ca
          </td>
          <td
            @click="getData(21, '#87131e', '#5e0d15')"
            id="Sc"
            class="transitionMetal cell"
            title="Scandium"
          >
            <sup>21</sup>Sc
          </td>
          <td
            @click="getData(22, '#87131e', '#5e0d15')"
            id="Ti"
            class="transitionMetal cell"
            title="Titanium"
          >
            <sup>22</sup>Ti
          </td>
          <td
            @click="getData(23, '#87131e', '#5e0d15')"
            id="V"
            class="transitionMetal cell"
            title="Vanadium"
          >
            <sup>23</sup>V
          </td>
          <td
            @click="getData(24, '#87131e', '#5e0d15')"
            id="Cr"
            class="transitionMetal cell"
            title="Chromium"
          >
            <sup>24</sup>Cr
          </td>
          <td
            @click="getData(25, '#87131e', '#5e0d15')"
            id="Mn"
            class="transitionMetal cell"
            title="Manganese"
          >
            <sup>25</sup>Mn
          </td>
          <td
            @click="getData(26, '#87131e', '#5e0d15')"
            id="Fe"
            class="transitionMetal cell"
            title="Iron"
          >
            <sup>26</sup>Fe
          </td>
          <td
            @click="getData(27, '#87131e', '#5e0d15')"
            id="Co"
            class="transitionMetal cell"
            title="Cobalt"
          >
            <sup>27</sup>Co
          </td>
          <td
            @click="getData(28, '#87131e', '#5e0d15')"
            id="Ni"
            class="transitionMetal cell"
            title="Nickel"
          >
            <sup>28</sup>Ni
          </td>
          <td
            @click="getData(29, '#87131e', '#5e0d15')"
            id="Cu"
            class="transitionMetal cell"
            title="Copper"
          >
            <sup>29</sup>Cu
          </td>
          <td
            @click="getData(30, '#87131e', '#5e0d15')"
            id="Zn"
            class="transitionMetal cell"
            title="Zinc"
          >
            <sup>30</sup>Zn
          </td>
          <td
            @click="getData(31, '#1dcdfe', '#148fb1')"
            id="Ga"
            class="postTransitionMetal cell"
            title="Gallium"
          >
            <sup>31</sup>Ga
          </td>
          <td
            @click="getData(32, '#21d0b2', '#17917c')"
            id="Ge"
            class="metalloid cell"
            title="Germanium"
          >
            <sup>32</sup>Ge
          </td>
          <td
            @click="getData(33, '#21d0b2', '#17917c')"
            id="As"
            class="metalloid cell"
            title="Arsenic"
          >
            <sup>33</sup>As
          </td>
          <td
            @click="getData(34, '#a0c768', '#657c41')"
            id="Se"
            class="reactiveNonMetal cell"
            title="Selenium"
          >
            <sup>34</sup>Se
          </td>
          <td
            @click="getData(35, '#a0c768', '#657c41')"
            id="Br"
            class="reactiveNonMetal cell"
            title="Bromine"
          >
            <sup>35</sup>Br
          </td>
          <td
            @click="getData(36, '#8400ff', '#5c00b2')"
            id="Kr"
            class="nobleGas cell"
            title="Krypton"
          >
            <sup>36</sup>Kr
          </td>
        </tr>
        <tr id="p5">
          <td class="groupCell">5</td>
          <td
            @click="getData(37, '#b8741a', '#805112')"
            id="Rb"
            class="alkaliMetal cell"
            title="Rubidium"
          >
            <sup>37</sup>Rb
          </td>
          <td
            @click="getData(38, '#f59a23', '#ab6b18')"
            id="Sr"
            class="alkalineEarthMetal cell"
            title="Strontium"
          >
            <sup>38</sup>Sr
          </td>
          <td
            @click="getData(39, '#87131e', '#5e0d15')"
            id="Y"
            class="transitionMetal cell"
            title="Yttrium"
          >
            <sup>39</sup>Y
          </td>
          <td
            @click="getData(40, '#87131e', '#5e0d15')"
            id="Zr"
            class="transitionMetal cell"
            title="Zirconium"
          >
            <sup>40</sup>Zr
          </td>
          <td
            @click="getData(41, '#87131e', '#5e0d15')"
            id="Nb"
            class="transitionMetal cell"
            title="Niobium"
          >
            <sup>41</sup>Nb
          </td>
          <td
            @click="getData(42, '#87131e', '#5e0d15')"
            id="Mo"
            class="transitionMetal cell"
            title="Molybdenum"
          >
            <sup>42</sup>Mo
          </td>
          <td
            @click="getData(43, '#87131e', '#5e0d15')"
            id="Tc"
            class="transitionMetal cell"
            title="Technetium"
          >
            <sup>43</sup>Tc
          </td>
          <td
            @click="getData(44, '#87131e', '#5e0d15')"
            id="Ru"
            class="transitionMetal cell"
            title="Ruthenium"
          >
            <sup>44</sup>Ru
          </td>
          <td
            @click="getData(45, '#87131e', '#5e0d15')"
            id="Rh"
            class="transitionMetal cell"
            title="Rhodium"
          >
            <sup>45</sup>Rh
          </td>
          <td
            @click="getData(46, '#87131e', '#5e0d15')"
            id="Pd"
            class="transitionMetal cell"
            title="Palladium"
          >
            <sup>46</sup>Pd
          </td>
          <td
            @click="getData(47, '#87131e', '#5e0d15')"
            id="Ag"
            class="transitionMetal cell"
            title="Silver"
          >
            <sup>47</sup>Ag
          </td>
          <td
            @click="getData(48, '#87131e', '#5e0d15')"
            id="Cd"
            class="transitionMetal cell"
            title="Cadmium"
          >
            <sup>48</sup>Cd
          </td>
          <td
            @click="getData(49, '#1dcdfe', '#148fb1')"
            id="In"
            class="postTransitionMetal cell"
            title="Indium"
          >
            <sup>49</sup>In
          </td>
          <td
            @click="getData(50, '#1dcdfe', '#148fb1')"
            id="Sn"
            class="postTransitionMetal cell"
            title="Tin"
          >
            <sup>50</sup>Sn
          </td>
          <td
            @click="getData(51, '#21d0b2', '#17917c')"
            id="Sb"
            class="metalloid cell"
            title="Antimony"
          >
            <sup>51</sup>Sb
          </td>
          <td
            @click="getData(52, '#21d0b2', '#17917c')"
            id="Te"
            class="metalloid cell"
            title="Tellurium"
          >
            <sup>52</sup>Te
          </td>
          <td
            @click="getData(53, '#a0c768', '#657c41')"
            id="I"
            class="reactiveNonMetal cell"
            title="Iodine"
          >
            <sup>53</sup>I
          </td>
          <td
            @click="getData(54, '#8400ff', '#5c00b2')"
            id="Xe"
            class="nobleGas cell"
            title="Xenon"
          >
            <sup>54</sup>Xe
          </td>
        </tr>
        <tr id="p6">
          <td class="groupCell">6</td>
          <td
            @click="getData(55, '#b8741a', '#805112')"
            id="Cs"
            class="alkaliMetal cell"
            title="Caesium"
          >
            <sup>55</sup>Cs
          </td>
          <td
            @click="getData(56, '#f59a23', '#ab6b18')"
            id="Ba"
            class="alkalineEarthMetal cell"
            title="Barium"
          >
            <sup>56</sup>Ba
          </td>
          <td class="empty"></td>
          <td
            @click="getData(72, '#87131e', '#5e0d15')"
            id="Hf"
            class="transitionMetal cell"
            title="Hafnium"
          >
            <sup>72</sup>Hf
          </td>
          <td
            @click="getData(73, '#87131e', '#5e0d15')"
            id="Ta"
            class="transitionMetal cell"
            title="Tantalum"
          >
            <sup>73</sup>Ta
          </td>
          <td
            @click="getData(74, '#87131e', '#5e0d15')"
            id="W"
            class="transitionMetal cell"
            title="Tungsten"
          >
            <sup>74</sup>W
          </td>
          <td
            @click="getData(75, '#87131e', '#5e0d15')"
            id="Re"
            class="transitionMetal cell"
            title="Rhenium"
          >
            <sup>75</sup>Re
          </td>
          <td
            @click="getData(76, '#87131e', '#5e0d15')"
            id="Os"
            class="transitionMetal cell"
            title="Osmium"
          >
            <sup>76</sup>Os
          </td>
          <td
            @click="getData(77, '#87131e', '#5e0d15')"
            id="Ir"
            class="transitionMetal cell"
            title="Iridium"
          >
            <sup>77</sup>Ir
          </td>
          <td
            @click="getData(78, '#87131e', '#5e0d15')"
            id="Pt"
            class="transitionMetal cell"
            title="Platinum"
          >
            <sup>78</sup>Pt
          </td>
          <td
            @click="getData(79, '#87131e', '#5e0d15')"
            id="Au"
            class="transitionMetal cell"
            title="Gold"
          >
            <sup>79</sup>Au
          </td>
          <td
            @click="getData(80, '#87131e', '#5e0d15')"
            id="Hg"
            class="transitionMetal cell"
            title="Mercury"
          >
            <sup>80</sup>Hg
          </td>
          <td
            @click="getData(81, '#1dcdfe', '#148fb1')"
            id="Tl"
            class="postTransitionMetal cell"
            title="Thallium"
          >
            <sup>81</sup>Tl
          </td>
          <td
            @click="getData(82, '#1dcdfe', '#148fb1')"
            id="Pb"
            class="postTransitionMetal cell"
            title="Lead"
          >
            <sup>82</sup>Pb
          </td>
          <td
            @click="getData(83, '#1dcdfe', '#148fb1')"
            id="Bi"
            class="postTransitionMetal cell"
            title="Bismuth"
          >
            <sup>83</sup>Bi
          </td>
          <td
            @click="getData(84, '#1dcdfe', '#148fb1')"
            id="Po"
            class="postTransitionMetal cell"
            title="Polonium"
          >
            <sup>84</sup>Po
          </td>
          <td
            @click="getData(85, '#21d0b2', '#17917c')"
            id="At"
            class="metalloid cell"
            title="Astatine"
          >
            <sup>85</sup>At
          </td>
          <td
            @click="getData(86, '#8400ff', '#5c00b2')"
            id="Rn"
            class="nobleGas cell"
            title="Radon"
          >
            <sup>86</sup>Rn
          </td>
        </tr>
        <tr id="p7">
          <td @click="getData(7)" class="groupCell">7</td>
          <td
            @click="getData(87, '#b8741a', '#805112')"
            id="Fr"
            class="alkaliMetal cell"
            title="Francium"
          >
            <sup>87</sup>Fr
          </td>
          <td
            @click="getData(88, '#f59a23', '#ab6b18')"
            id="Ra"
            class="alkalineEarthMetal cell"
            title="Radium"
          >
            <sup>88</sup>Ra
          </td>
          <td class="empty"></td>
          <td
            @click="getData(104, '#87131e', '#5e0d15')"
            id="Rf"
            class="transitionMetal cell"
            title="Rutherfordium"
          >
            <sup>104</sup>Rf
          </td>
          <td
            @click="getData(105, '#87131e', '#5e0d15')"
            id="Db"
            class="transitionMetal cell"
            title="Dubnium"
          >
            <sup>105</sup>Db
          </td>
          <td
            @click="getData(106, '#87131e', '#5e0d15')"
            id="Sg"
            class="transitionMetal cell"
            title="Seaborgium"
          >
            <sup>106</sup>Sg
          </td>
          <td
            @click="getData(107, '#87131e', '#5e0d15')"
            id="Bh"
            class="transitionMetal cell"
            title="Bohrium"
          >
            <sup>107</sup>Bh
          </td>
          <td
            @click="getData(108, '#87131e', '#5e0d15')"
            id="Hs"
            class="transitionMetal cell"
            title="Hassium"
          >
            <sup>108</sup>Hs
          </td>
          <td
            @click="getData(109, 'dimgrey', 'dimgrey')"
            id="Mt"
            class="unknown cell"
            title="Meitnerium"
          >
            <sup>109</sup>Mt
          </td>
          <td
            @click="getData(110, 'dimgrey', 'dimgrey')"
            id="Ds"
            class="unknown cell"
            title="Darmstadtium"
          >
            <sup>110</sup>Ds
          </td>
          <td
            @click="getData(111, 'dimgrey', 'dimgrey')"
            id="Rg"
            class="unknown cell"
            title="Roentgenium"
          >
            <sup>111</sup>Rg
          </td>
          <td
            @click="getData(112, 'dimgrey', 'dimgrey')"
            id="Cn"
            class="unknown cell"
            title="Copernicium"
          >
            <sup>112</sup>Cn
          </td>
          <td
            @click="getData(113, 'dimgrey', 'dimgrey')"
            id="Nh"
            class="unknown cell"
            title="Nihonium"
          >
            <sup>113</sup>Nh
          </td>
          <td
            @click="getData(114, 'dimgrey', 'dimgrey')"
            id="Fl"
            class="unknown cell"
            title="Flerovium"
          >
            <sup>114</sup>Fl
          </td>
          <td
            @click="getData(115, 'dimgrey', 'dimgrey')"
            id="Mc"
            class="unknown cell"
            title="Moscovium"
          >
            <sup>115</sup>Mc
          </td>
          <td
            @click="getData(116, 'dimgrey', 'dimgrey')"
            id="Lv"
            class="unknown cell"
            title="Livermorium"
          >
            <sup>116</sup>Lv
          </td>
          <td
            @click="getData(117, 'dimgrey', 'dimgrey')"
            id="Ts"
            class="unknown cell"
            title="Tennessine"
          >
            <sup>117</sup>Ts
          </td>
          <td
            @click="getData(118, 'dimgrey', 'dimgrey')"
            id="Og"
            class="unknown cell"
            title="Oganesson"
          >
            <sup>118</sup>Og
          </td>
        </tr>
        <tr class="spacer">
          <td class="empty" colspan="18"></td>
        </tr>
        <tr>
          <td class="empty" colspan="2"></td>
          <td class="groupCell">6</td>
          <td
            @click="getData(57, '#cccc00', '#888800')"
            id="La"
            class="lanthanoid cell"
            title="Lanthanum"
          >
            <sup>57</sup>La
          </td>
          <td
            @click="getData(58, '#cccc00', '#888800')"
            id="Ce"
            class="lanthanoid cell"
            title="Cerium"
          >
            <sup>58</sup>Ce
          </td>
          <td
            @click="getData(59, '#cccc00', '#888800')"
            id="Pr"
            class="lanthanoid cell"
            title="Praseodymium"
          >
            <sup>59</sup>Pr
          </td>
          <td
            @click="getData(60, '#cccc00', '#888800')"
            id="Nd"
            class="lanthanoid cell"
            title="Neodymium"
          >
            <sup>60</sup>Nd
          </td>
          <td
            @click="getData(61, '#cccc00', '#888800')"
            id="Pm"
            class="lanthanoid cell"
            title="Promethium"
          >
            <sup>61</sup>Pm
          </td>
          <td
            @click="getData(62, '#cccc00', '#888800')"
            id="Sm"
            class="lanthanoid cell"
            title="Samarium"
          >
            <sup>62</sup>Sm
          </td>
          <td
            @click="getData(63, '#cccc00', '#888800')"
            id="Eu"
            class="lanthanoid cell"
            title="Europium"
          >
            <sup>63</sup>Eu
          </td>
          <td
            @click="getData(64, '#cccc00', '#888800')"
            id="Gd"
            class="lanthanoid cell"
            title="Gadolinium"
          >
            <sup>64</sup>Gd
          </td>
          <td
            @click="getData(65, '#cccc00', '#888800')"
            id="Tb"
            class="lanthanoid cell"
            title="Terbium"
          >
            <sup>65</sup>Tb
          </td>
          <td
            @click="getData(66, '#cccc00', '#888800')"
            id="Dy"
            class="lanthanoid cell"
            title="Dysprosium"
          >
            <sup>66</sup>Dy
          </td>
          <td
            @click="getData(67, '#cccc00', '#888800')"
            id="Ho"
            class="lanthanoid cell"
            title="Holmium"
          >
            <sup>67</sup>Ho
          </td>
          <td
            @click="getData(68, '#cccc00', '#888800')"
            id="Er"
            class="lanthanoid cell"
            title="Erbium"
          >
            <sup>68</sup>Er
          </td>
          <td
            @click="getData(69, '#cccc00', '#888800')"
            id="Tm"
            class="lanthanoid cell"
            title="Thulium"
          >
            <sup>69</sup>Tm
          </td>
          <td
            @click="getData(70, '#cccc00', '#888800')"
            id="Yb"
            class="lanthanoid cell"
            title="Ytterbium"
          >
            <sup>70</sup>Yb
          </td>
          <td
            @click="getData(71, '#cccc00', '#888800')"
            id="Lu"
            class="lanthanoid cell"
            title="Lutetium"
          >
            <sup>71</sup>Lu
          </td>
          <td class="empty"></td>
        </tr>
        <tr>
          <td class="empty" colspan="2"></td>
          <td class="groupCell">7</td>
          <td
            @click="getData(89, '#cc66b0', '#8e477b')"
            id="Ac"
            class="actinoid cell"
            title="Actinium"
          >
            <sup>89</sup>Ac
          </td>
          <td
            @click="getData(90, '#cc66b0', '#8e477b')"
            id="Th"
            class="actinoid cell"
            title="Thorium"
          >
            <sup>90</sup>Th
          </td>
          <td
            @click="getData(91, '#cc66b0', '#8e477b')"
            id="Pa"
            class="actinoid cell"
            title="Protactinium"
          >
            <sup>91</sup>Pa
          </td>
          <td
            @click="getData(92, '#cc66b0', '#8e477b')"
            id="U"
            class="actinoid cell"
            title="Uranium"
          >
            <sup>92</sup>U
          </td>
          <td
            @click="getData(93, '#cc66b0', '#8e477b')"
            id="Np"
            class="actinoid cell"
            title="Neptunium"
          >
            <sup>93</sup>Np
          </td>
          <td
            @click="getData(94, '#cc66b0', '#8e477b')"
            id="Pu"
            class="actinoid cell"
            title="Plutonium"
          >
            <sup>94</sup>Pu
          </td>
          <td
            @click="getData(95, '#cc66b0', '#8e477b')"
            id="Am"
            class="actinoid cell"
            title="Americium"
          >
            <sup>95</sup>Am
          </td>
          <td
            @click="getData(96, '#cc66b0', '#8e477b')"
            id="Cm"
            class="actinoid cell"
            title="Curium"
          >
            <sup>96</sup>Cm
          </td>
          <td
            @click="getData(97, '#cc66b0', '#8e477b')"
            id="Bk"
            class="actinoid cell"
            title="Berkelium"
          >
            <sup>97</sup>Bk
          </td>
          <td
            @click="getData(98, '#cc66b0', '#8e477b')"
            id="Cf"
            class="actinoid cell"
            title="Californium"
          >
            <sup>98</sup>Cf
          </td>
          <td
            @click="getData(99, '#cc66b0', '#8e477b')"
            id="Es"
            class="actinoid cell"
            title="Einsteinium"
          >
            <sup>99</sup>Es
          </td>
          <td
            @click="getData(100, '#cc66b0', '#8e477b')"
            id="Fm"
            class="actinoid cell"
            title="Fermium"
          >
            <sup>100</sup>Fm
          </td>
          <td
            @click="getData(101, '#cc66b0', '#8e477b')"
            id="Md"
            class="actinoid cell"
            title="Mendelevium"
          >
            <sup>101</sup>Md
          </td>
          <td
            @click="getData(102, '#cc66b0', '#8e477b')"
            id="No"
            class="actinoid cell"
            title="Nobelium"
          >
            <sup>102</sup>No
          </td>
          <td
            @click="getData(103, '#cc66b0', '#8e477b')"
            id="Lr"
            class="actinoid cell"
            title="Lawrencium"
          >
            <sup>103</sup>Lr
          </td>
          <td class="empty"></td>
        </tr>
      </table>
    </div>
  </div>
  <Footer />
</template>

<script>
import ElementInfoTable from '../components/ElementInfoTable'
import Footer from '../components/Footer'
import apiService from '@/services/index.js'
// eslint-disable-next-line no-unused-vars
import storage from '@/store'

export default {
  data() {
    return {
      bgColor: '#a0c768',
      borderColor: '#657c41',
      element: {
        atomicRadius: 454.59,
        atomicWeight: 1.008,
        boilingTemperature: 607,
        category: {
          categoryName: 'неметали',
        },
        electronQuantity: 588,
        electronegativity: 511.1,
        elementId: 1,
        energyLevels: 0,
        group: 1,
        meltingTemperature: 1,
        name: 'Гідроген',
        neutronQuantity: 733,
        protonQuantity: 936,
        symbol: 'Н',
        valences: [{ valenceVal: 1 }],
        isLocked: 0,
      },
    }
  },
  components: {
    Footer,
    ElementInfoTable,
  },
  methods: {
    getData(id, bgColor, borderColor) {
      apiService.getElement(id).then((resp) => {
        console.log(resp)
        this.element = resp.data
        this.bgColor = bgColor
        this.borderColor = borderColor
      })
    },
  },
}
</script>

<style type="text/css">
#periodic {
  margin-left: auto;
  margin-right: auto;
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
  width: 3.5vw;
  height: 3.5vw;
  border-width: 3px;
  border-spacing: 6px;
}

@media (max-width: 700px) {
  #periodic tr td {
    border-width: 2px;
  }
}

#elementLogo .number {
  font-size: 2vw;
  color: white;
}

#elementLogo .symbol {
  font-size: 3vw;
  color: white;
}

#elementInfo {
  width: 18vw;
  margin-left: auto;
  margin-right: auto;
  position: relative;
  font-size: 0.8vw;
}

#periodic tr td.empty {
  background-color: transparent;
  cursor: auto;
  border: transparent;
  text-align: left;
}

#periodic tr.spacer td {
  height: 4vw;
}

#periodic tr td sup {
  font-size: 0.5vw;
  display: block;
  text-align: center;
}

#periodic tr td {
  font-size: 1.2vw;
  text-align: center;
  position: relative;
}

#periodic tr td.alkalineEarthMetal {
  border-color: #f59a23;
  background: #f59a23;
  font-weight: bolder;
}

#periodic tr td.alkaliMetal {
  border-color: #b8741a;
  background: #b8741a;
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
  border-color: #cc66b0;
  background: #cc66b0;
  font-weight: bolder;
}

#periodic tr td.metalloid {
  border-color: #21d0b2;
  background: #21d0b2;
  font-weight: bolder;
}

#periodic tr td.postTransitionMetal {
  border-color: #1dcdfe;
  background: #1dcdfe;
  font-weight: bolder;
}

#periodic tr td.nobleGas {
  border-color: #8400ff;
  background: #8400ff;
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
  font-size: 0.8vw;
  text-align: center;
  position: relative;
}

#periodic tr td.legend.alkalineEarthMetals {
  border-color: #f59a23;
  background: #ab6b18;
}

#periodic tr td.legend.alkaliMetals {
  border-color: #b8741a;
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
  border-color: #cc66b0;
  background: #8e477b;
}

#periodic tr td.legend.metalloids {
  border-color: #21d0b2;
  background: #17917c;
}

#periodic tr td.legend.postTransitionMetals {
  border-color: #1dcdfe;
  background: #148fb1;
}

#periodic tr td.legend.nobleGases {
  border-color: #8400ff;
  background: #5c00b2;
}

#periodic tr td.legend.reactiveNonMetals {
  border-color: #a1c768;
  background: #657c41;
}

#periodic tr td.periodCell {
  width: 3.5vw;
  height: 3.5vw;
  cursor: auto;
  border: transparent;
  background: transparent;
}

#periodic tr td.groupCell {
  width: 3.5vw;
  height: 3.5vw;
  cursor: auto;
  border: transparent;
  background: transparent;
}

.cell {
  cursor: pointer;
  transition: all 0.2s ease-in-out;
}

.cell:hover {
  transform: scale(1.05, 1.05);
}

.tooltip {
  position: relative;
  display: inline-block;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 6.5vw;
  background-color: #21d0b2;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  top: -5px;
  left: 105%;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}

#elementLogo {
  border-width: 0.5vw;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 10px;
  padding: 0.3vw;
  color: white;
  font-weight: bold;
  width: 10vw;
  height: 10vw;
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  line-height: 1;
}
</style>
