<?php
declare(strict_types=1);

namespace Lcobucci\JWT\Tests\Validation\Constraint;

use DateInterval;
use Lcobucci\Clock\Clock;
use Lcobucci\JWT\Token;
use Lcobucci\JWT\Token\RegisteredClaims;
use Lcobucci\JWT\Validation\Constraint;
use Lcobucci\JWT\Validation\Constraint\StrictValidAt;
use Lcobucci\JWT\Validation\ConstraintViolation;

/**
 * @covers \Lcobucci\JWT\Validation\Constraint\LeewayCannotBeNegative
 * @covers \Lcobucci\JWT\Validation\ConstraintViolation
 * @covers \Lcobucci\JWT\Validation\Constraint\StrictValidAt
 *
 * @uses \Lcobucci\JWT\Token\DataSet
 * @uses \Lcobucci\JWT\Token\Plain
 * @uses \Lcobucci\JWT\Token\Signature
 */
final class StrictValidAtTest extends ValidAtTestCase
{
    protected function buildValidAtConstraint(Clock $clock, ?DateInterval $leeway = null): Constraint
    {
        return new StrictValidAt($clock, $leeway);
    }

    /** @test */
    public function assertShouldRaiseExceptionWhenTokenIsNotAPlainToken(): void
    {
        $this->expectException(ConstraintViolation::class);
        $this->expectExceptionMessage('You should pass a plain token');

        $constraint = $this->buildValidAtConstraint($this->clock);
        $constraint->assert($this->createMock(Token::class));
    }

    /** @test */
    public function assertShouldRaiseExceptionWhenIatClaimIsMissing(): void
    {
        $this->expectException(ConstraintViolation::class);
        $this->expectExceptionMessage('"Issued At" claim missing');

        $constraint = $this->buildValidAtConstraint($this->clock);
        $constraint->assert($this->buildToken());
    }

    /** @test */
    public function assertShouldRaiseExceptionWhenNbfClaimIsMissing(): void
    {
        $this->expectException(ConstraintViolation::class);
        $this->expectExceptionMessage('"Not Before" claim missing');

        $now    = $this->clock->now();
        $claims = [
            RegisteredClaims::ISSUED_AT => $now->modify('-5 seconds'),
        ];

        $constraint = $this->buildValidAtConstraint($this->clock);
        $constraint->assert($this->buildToken($claims));
    }

    /** @test */
    public function assertShouldRaiseExceptionWhenExpClaimIsMissing(): void
    {
        $this->expectException(ConstraintViolation::class);
        $this->expectExceptionMessage('"Expiration Time" claim missing');

        $now    = $this->clock->now();
        $claims = [
            RegisteredClaims::ISSUED_AT => $now->modify('-5 seconds'),
            RegisteredClaims::NOT_BEFORE => $now->modify('-5 seconds'),
        ];

        $constraint = $this->buildValidAtConstraint($this->clock);
        $constraint->assert($this->buildToken($claims));
    }
}
