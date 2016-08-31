describe LineCounter, '#total_lines_per_speaker' do

  let(:counter) { subject }
  XML_NO_SPEECH = "<?xml version=\"1.0\"?>\n<!DOCTYPE PLAY SYSTEM \"play.dtd\">\n\n<PLAY>\n<TITLE>The Tragedy of Macbeth</TITLE>\n\n<FM>\n<P>Text placed in the public domain by Moby Lexical Tools, 1992.</P>\n<P>SGML markup by Jon Bosak, 1992-1994.</P>\n<P>XML version by Jon Bosak, 1996-1998.</P>\n<P>This work may be freely copied and distributed worldwide.</P>\n</FM>\n</PLAY>\n"
  XML_SOME_SPEECH = "<?xml version=\"1.0\"?>\n<!DOCTYPE PLAY SYSTEM \"play.dtd\">\n\n<PLAY>\n<TITLE>The Tragedy of Macbeth</TITLE>\n\n<FM>\n<P>Text placed in the public domain by Moby Lexical Tools, 1992.</P>\n<P>SGML markup by Jon Bosak, 1992-1994.</P>\n<P>XML version by Jon Bosak, 1996-1998.</P>\n<P>This work may be freely copied and distributed worldwide.</P>\n</FM>\n<ACT><TITLE>ACT I</TITLE>\n\n<SCENE><TITLE>SCENE I.  A desert place.</TITLE>\n<STAGEDIR>Thunder and lightning. Enter three Witches</STAGEDIR>\n\n<SPEECH>\n<SPEAKER>First Witch</SPEAKER>\n<LINE>When shall we three meet again</LINE>\n<LINE>In thunder, lightning, or in rain?</LINE>\n</SPEECH>\n\n<SPEECH>\n<SPEAKER>Second Witch</SPEAKER>\n<LINE>When the hurlyburly's done,</LINE>\n<LINE>When the battle's lost and won.</LINE>\n</SPEECH>\n\n<SPEECH>\n<SPEAKER>Third Witch</SPEAKER>\n<LINE>That will be ere the set of sun.</LINE>\n</SPEECH>\n\n<SPEECH>\n<SPEAKER>First Witch</SPEAKER>\n<LINE>Where the place?</LINE>\n</SPEECH>\n\n<SPEECH>\n<SPEAKER>Second Witch</SPEAKER>\n<LINE>Upon the heath.</LINE>\n</SPEECH>\n\n</SCENE>\n\n</ACT>\n\n</PLAY>\n"

  context 'when there are no speech lines' do
    it 'returns an empty hash' do
      expect(counter.total_lines_per_speaker(XML_NO_SPEECH)).to eq({})
    end
  end

  context 'when there are some speech lines' do
    it 'returns a hash with appropirate speaker/lines key/values' do
      expect(counter.total_lines_per_speaker(XML_SOME_SPEECH))
        .to eq({ 'First Witch'  => 3,
                 'Second Witch' => 3,
                 'Third Witch'  => 1})
    end
  end
end
