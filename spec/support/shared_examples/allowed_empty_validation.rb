shared_examples "allowed empty validation" do |*attrs|
	attrs.each do |attr|
		it "is valid without #{attr.to_s}" do
			subject.send("#{attr.to_s}=", nil)
			expect(subject).to be_valid
		end
	end
end